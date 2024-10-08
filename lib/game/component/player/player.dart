import 'package:flame/collisions.dart';
import 'package:flame/events.dart';

import '../../../export.dart';
import '../../../feature/common/util/dispose_bag.dart';
import '../jewel/jewel_component.dart';
import '../vfx/vfx_effect.dart';
import 'player_readonly.dart';

class Player extends PositionComponent with GRef, DisposeBag {
  Player({
    super.key,
  });

  double speed = 200;
  V2 velocity = V2.zero();

  final PlayerReadonly innerPlayer = PlayerReadonly(initialPlayerState: manager.me.value);

  double accDelta = 0;
  V2 lastMovementPosition = V2.zero();

  @override
  FutureOr<void> onLoad() async {
    size = V2.all(Const.playerSize);

    add(CircleHitbox());
    _initPlayer();
  }

  void _initPlayer() {
    add(innerPlayer);

    listenValue(manager.me, (v) {
      innerPlayer.updateWithPlayerState(v, updatePosition: false);
    });
  }

  void moveWithTapDown(TapDownEvent event) {
    lastMovementPosition = event.localPosition;
  }

  @override
  void update(double dt) {
    super.update(dt);
    accDelta += dt;
    _calculateVelocity();
    _updatePosition(dt);

    // send position information to channel
    if (accDelta >= (kDebugMode ? 0.1 : 0.1)) {
      _onPositionChanged(x, y);
      accDelta = 0;
    }
  }

  void _calculateVelocity() {
    var radians = V2(1, 0).angleToSigned(lastMovementPosition - position);

    velocity.x = cos(radians) * speed;
    velocity.y = sin(radians) * speed;

    if (lastMovementPosition.distanceTo(position) <= 10) {
      velocity = V2.zero();
    }
  }

  void _updatePosition(double dt) {
    position += velocity * dt;

    // Clamp with boundary
    position.x = position.x.clamp(Const.worldPadding, Const.worldWidth - Const.worldPadding);
    position.y = position.y.clamp(Const.worldPadding, Const.worldHeight - Const.worldPadding);
  }

  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is JewelComponent) {
      _hitJewel(intersectionPoints, other);
    } else if (other is PlayerReadonly) {
      assert(other.userId != manager.me.value.id);
      _hitOtherPlayer(intersectionPoints, other);
    }
  }

  void _hitJewel(Set<Vector2> intersectionPoints, JewelComponent jewel) {
    var (isDestoryed,) = jewel.hitByPlayer(damage: 1);
    game.gameWorld.add(FireVfxEffect()
      ..position =
          intersectionPoints.first + V2(Random().nextDouble() * 30 - 15, Random().nextDouble() * 30 - 15));

    if (isDestoryed) {
      _onExpGained(jewel.jewel.exp);
    }
  }

  void _hitOtherPlayer(Set<Vector2> intersectionPoints, PlayerReadonly otherPlayer) {
    var playerState = manager.players[otherPlayer.userId]!.value;
    if (playerState.hp >= 1) {
      game.gameWorld.add(
        FireVfxEffect()
          ..position =
              intersectionPoints.first + V2(Random().nextDouble() * 30 - 15, Random().nextDouble() * 30 - 15),
      );

      var nextHp = max(0, playerState.hp - 1);
      var isDead = nextHp == 0;
      manager.updateOtherPlayer(playerState.copyWith(hp: nextHp));
      if (isDead) {
        channelManager.sendPlayerDead(id: playerState.id);
      } else {
        channelManager.sendStatus(id: playerState.id, hp: nextHp);
      }
    }
  }

  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {}

  void _onPositionChanged(double x, double y) {
    channelManager.sendStatus(x: x, y: y);
  }

  void _onExpGained(int exp) {
    var nextExp = manager.me.value.exp + exp;
    manager.me.value = manager.me.value.copyWith(exp: nextExp);
    channelManager.sendStatus(exp: exp);
  }
}
