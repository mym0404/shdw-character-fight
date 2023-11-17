import 'package:flame/game.dart';

import '../export.dart';
import 'main_game.dart';
import 'overlay/game_ready_overlay.dart';
import 'overlay/overlay_id.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final MainGame _game = MainGame();

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: _game,
      overlayBuilderMap: {
        OverlayId.ready: (context, game) => GameReadyOverlay(game: game as MainGame),
      },
    );
  }
}
