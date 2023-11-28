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

  double maxSpeed = 250;
  V2 velocity = V2.zero();

  final PlayerReadonly innerPlayer = PlayerReadonly(isMe: true, userId: manager.me.value.id);

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

  void moveWithMousePosition(PointerHoverInfo info) {
    var worldPosition = game.cam.globalToLocal(info.eventPosition.widget);
    lastMovementPosition = worldPosition;
  }

  @override
  void update(double dt) {
    super.update(dt);
    accDelta += dt;
    _calculateVelocity();
    _updatePosition(dt);

    // send position information to channel
    if (accDelta >= (kDebugMode ? 5.0 : 0.1)) {
      _onPositionChanged(x, y);
      accDelta = 0;
    }
  }

  void _calculateVelocity() {
    var radians = V2(1, 0).angleToSigned(lastMovementPosition - position);
    var speed = lastMovementPosition.distanceTo(position).clamp(0, maxSpeed);

    velocity.x = cos(radians) * speed;
    velocity.y = sin(radians) * speed;
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
