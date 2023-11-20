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

  @override
  FutureOr<void> onLoad() {
    add(CircleHitbox());
    size = V2.all(radius * 2);
  }

  @override
  PositionComponent get renderChild => CircleComponent(radius: radius, paint: Paint()..color = C.primary);

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    parent.onCollision(other);
  }
}
