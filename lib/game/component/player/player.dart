import 'package:flame/collisions.dart';
import 'package:flame/events.dart';

import '../../../export.dart';
import '../../util/DisposeBag.dart';
import '../jewel/jewel_component.dart';
import 'player_readonly.dart';

class Player extends PositionComponent with GRef, DisposeBag {
  Player({super.key});

  double maxSpeed = 100;
  V2 velocity = V2.zero();

  final PlayerReadonly innerPlayer = PlayerReadonly(isMe: true);

  double accDelta = 0;

  @override
  FutureOr<void> onLoad() async {
    size = V2.all(Const.playerSize);

    add(CircleHitbox());
    _initPlayer();
  }

  void _initPlayer() {
    add(innerPlayer);

    listenStream(manager.me, (v) {
      innerPlayer.updateWithPlayerState(v);
    });
  }

  void moveWithMousePosition(PointerHoverInfo info) {
    var worldPosition = game.cam.globalToLocal(info.eventPosition.widget);
    var radians = V2(1, 0).angleToSigned(worldPosition - position);

    var speed = worldPosition.distanceTo(position).clamp(0, maxSpeed);

    velocity.x = cos(radians) * speed;
    velocity.y = sin(radians) * speed;
  }

  @override
  void update(double dt) {
    super.update(dt);
    accDelta += dt;
    _updatePosition(dt);

    if (accDelta >= (kDebugMode ? 5.0 : 0.1)) {
      channelManager.sendPosition(x, y);
      accDelta = 0;
    }
  }

  void _updatePosition(double dt) {
    position += velocity * dt;

    // Clamp with boundary
    position.x = position.x.clamp(Const.worldPadding, Const.worldWidth - Const.worldPadding);
    position.y = position.y.clamp(Const.worldPadding, Const.worldHeight - Const.worldPadding);
  }

  void onCollision(PositionComponent other) {
    if (other is JewelComponent) {
      log.i(other);
    }
  }
}
