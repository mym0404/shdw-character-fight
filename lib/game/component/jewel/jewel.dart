import 'package:flame/collisions.dart';

import '../../../export.dart';

abstract class Jewel {
  int get hp;
  int get exp;
  double size = 24;

  PositionComponent renderComponent() {
    return CircleComponent(radius: size, paint: Paint()..color = Colors.blueGrey);
  }

  ShapeHitbox renderHitBox() {
    return CircleHitbox(radius: size)..collisionType = CollisionType.passive;
  }
}
