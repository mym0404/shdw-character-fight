import '../../export.dart';
import '../../feature/common/widget/blur.dart';
import '../../feature/common/widget/overlay_panel.dart';
import '../main_game.dart';

class GameReadyOverlay extends StatelessWidget {
  const GameReadyOverlay({super.key, required this.game});

  final MainGame game;

  @override
  Widget build(BuildContext context) {
    return BackdropBlur(
      colorOpacity: 0.1,
      child: Center(
        child: OverlayPanel(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '수학대왕 캐릭터 키우기',
                style: TS.displaySmall,
              ),
              const Gap(48),
              FilledButton(onPressed: () {
                game.startGame();
              }, child: Text('시작하기'))
            ],
          ),
        ),
      ),
    );
  }
}
