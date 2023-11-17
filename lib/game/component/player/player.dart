import 'package:flame/collisions.dart';
import 'package:flame/events.dart';

import '../../../export.dart';
import '../../state/player_state.dart';
import '../../util/DisposeBag.dart';
import 'player_hud.dart';

class Player extends PositionComponent with GRef, CollisionCallbacks, DisposeBag {
  Player({
    this.circleSize = Const.initialPlayerSize,
    required this.state,
  });

  double circleSize;
  double maxSpeed = 1000;
  V2 velocity = V2.zero();

  late PlayerHud hud;

  final BS<PlayerState> state;

  @override
  FutureOr<void> onLoad() async {
    size = V2.all(circleSize);

    add(CircleHitbox());
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
    size = Vector2.all(circleSize);
    _updatePosition(dt);
  }

  void _updatePosition(double dt) {
    position += velocity * dt;

    // Clamp with boundary
    position.x = position.x.clamp(Const.worldPadding, Const.worldWidth - Const.worldPadding - circleSize);
    position.y = position.y.clamp(Const.worldPadding, Const.worldHeight - Const.worldPadding - circleSize);
  }
}
