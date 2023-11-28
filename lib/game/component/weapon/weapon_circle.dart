import 'package:flame/collisions.dart';

import '../../../export.dart';
import 'player_weapon.dart';

class WeaponCircle extends PositionComponent
    with CollisionCallbacks, ParentIsA<PlayerWeapon>
    implements Weapon {
  WeaponCircle({
    required this.withCollisionCallbacks,
  });

  bool withCollisionCallbacks;

  @override
  int get damage => 1;

  @override
  double get radius => 6;

  bool isCanCollide = true;
  double collisionReEnableDelay = 0.5;
  double accumulatedDtAfterCollisionDisabled = 0;

  @override
  FutureOr<void> onLoad() {
    if (withCollisionCallbacks) {
      add(CircleHitbox());
    }
    size = V2.all(radius * 2);
  }

  @override
  PositionComponent get renderChild => CircleComponent(
        radius: radius,
        paint: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5
          ..color = C.primary,
      );

  @override
  void update(double dt) {
    super.update(dt);

    if (!isCanCollide) {
      accumulatedDtAfterCollisionDisabled += dt;

      if (accumulatedDtAfterCollisionDisabled >= collisionReEnableDelay) {
        accumulatedDtAfterCollisionDisabled = 0;
        isCanCollide = true;
      }
    }
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    assert(withCollisionCallbacks);
    if (!isCanCollide) return;
    isCanCollide = false;
    super.onCollisionStart(intersectionPoints, other);
    parent.onCollisionStart(intersectionPoints, other);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    assert(withCollisionCallbacks);
    super.onCollision(intersectionPoints, other);
    parent.onCollision(intersectionPoints, other);
  }
}
