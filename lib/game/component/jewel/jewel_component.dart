import 'package:flame/collisions.dart';

import '../../../export.dart';
import 'jewel.dart';

class JewelComponent extends PositionComponent with CollisionCallbacks {
  JewelComponent({required this.jewel});

  Jewel jewel;

  @override
  FutureOr<void> onLoad() {
    _renderJewel();
    _addHitbox();
  }

  void _renderJewel() {
    var component = jewel.renderComponent()..anchor = Anchor.center;
    add(component);
  }

  void _addHitbox() {
    var hitbox = jewel.renderHitBox()..anchor = Anchor.center;
    add(hitbox);
  }
}
