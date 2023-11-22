import '../../../export.dart';

class JewelSpriteAnimationComponent extends SpriteAnimationComponent with GRef {
  JewelSpriteAnimationComponent({
    required this.assetName,
    required this.frameCount,
    super.size,
  });

  String assetName;
  int frameCount;

  @override
  FutureOr<void> onLoad() {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache(assetName),
      SpriteAnimationData.sequenced(
        amount: frameCount,
        stepTime: 0.05,
        textureSize: V2.all(128),
      ),
    );
  }
}
