import 'package:flame/collisions.dart';

import '../../../export.dart';
import 'hud/jewel_hud.dart';
import 'jewel.dart';

class JewelComponent extends PositionComponent with CollisionCallbacks {
  JewelComponent({required this.jewel}) : _hp = jewel.hp;

  late JewelHud hud;
  Jewel jewel;

  int _hp;

  int get hp => _hp;
  set hp(int value) {
    _hp = value;
    hud.applyHp(value);
  }

  @override
  FutureOr<void> onLoad() {
    size = V2.all(jewel.size);
    anchor = Anchor.center;
    _renderJewel();
    _addHitbox();
    _addHud();
  }

  void _renderJewel() {
    var component = jewel.renderComponent();
    add(component);
  }

  void _addHitbox() {
    var hitbox = jewel.renderHitBox();
    add(hitbox);
  }

  void _addHud() {
    hud = JewelHud(jewel: jewel)..position = V2(width / 2, -4);
    add(hud);
  }
}
