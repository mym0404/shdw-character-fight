import 'package:flame/events.dart';
import 'package:flame/game.dart';

import '../export.dart';
import 'overlay/overlay_id.dart';
import 'state/game_manager.dart';
import 'state/game_state.dart';
import 'world/game_world.dart';

class MainGame extends FlameGame with MouseMovementDetector, HasCollisionDetection {
  late CameraComponent cam;

  GameManager get gameManager => di<GameManager>();
  GameState get gameState => gameManager.state.value;

  GameWorld get gameWorld => world as GameWorld;

  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();
    _loadWorldAndCam();

    overlays.add(OverlayId.ready);
  }

  Future<void> startGame({required String nickname}) async {
    overlays.clear();
    gameManager.setMeProfile(nickname: nickname);
    await channelManager.trackMe(gameManager.me.value);
    gameWorld.addMyPlayer();
    gameManager.startGame();
  }

  void _loadWorldAndCam() {
    cam = CameraComponent()..viewfinder.anchor = Anchor.topLeft;
    world = GameWorld();
    cam.world = world;
    addAll([world, cam]);
  }

  @override
  void onMouseMove(PointerHoverInfo info) {
    gameWorld.onMouseMove(info);
  }
}
