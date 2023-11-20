import 'package:flame/collisions.dart';

import '../../../export.dart';

abstract class Jewel {
  int get hp;
  int get exp;
  String get name;
  int get level;
  double size = 48;

  PositionComponent renderComponent() {
    return CircleComponent(radius: size / 2, paint: Paint()..color = Colors.blueGrey);
  }

  ShapeHitbox renderHitBox() {
    return CircleHitbox(radius: size / 2)..collisionType = CollisionType.passive;
  }
}
