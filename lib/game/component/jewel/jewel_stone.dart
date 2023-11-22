import 'package:flame/effects.dart';

import '../../../export.dart';
import 'jewel.dart';
import 'jewel_sprite_animation_component.dart';

class JewelStone extends Jewel {
  @override
  int get exp => 1;

  @override
  int get hp => 10;

  @override
  int get level => 1;

  @override
  String get name => '돌맹이';

  @override
  PositionComponent renderComponent() {
    return JewelSpriteAnimationComponent(assetName: 'planet/stone.png', frameCount: 1, size: size.v2);
  }
}
