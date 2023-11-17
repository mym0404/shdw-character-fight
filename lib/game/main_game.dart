import 'package:flame/events.dart';
import 'package:flame/game.dart';

import '../export.dart';
import 'component/player/player.dart';
import 'overlay/overlay_id.dart';
import 'state/game_state.dart';
import 'world/game_world.dart';

class MainGame extends FlameGame with MouseMovementDetector, HasCollisionDetection {
  late CameraComponent cam;
  final GameState gameState = GameState();
  final Player me = Player(isMe: true);

  GameWorld get gameWorld => world as GameWorld;

  @override
  FutureOr<void> onLoad() {
    _loadWorldAndCam();

    overlays.add(OverlayId.ready);
  }

  void startGame() {
    overlays.clear();
  }

  void _loadWorldAndCam() {
    cam = CameraComponent()..viewfinder.anchor = Anchor.topLeft;
    world = GameWorld(me: me);
    cam.world = world;
    addAll([world, cam]);
  }

  @override
  void onMouseMove(PointerHoverInfo info) {
    gameWorld.onMouseMove(info);
  }
}
