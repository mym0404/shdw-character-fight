import 'package:cached_network_image/cached_network_image.dart';

import '../../export.dart';
import '../../feature/common/widget/blur.dart';
import '../../feature/common/widget/overlay_panel.dart';
import '../main_game.dart';

class GameReadyOverlay extends StatefulWidget {
  const GameReadyOverlay({super.key});

  @override
  State<GameReadyOverlay> createState() => _GameReadyOverlayState();
}

class _GameReadyOverlayState extends State<GameReadyOverlay> {
  late final nickname = TC(text: '문명주');

  MainGame get game => di();

  @override
  void initState() {
    super.initState();

    if (kDebugMode) {
      500.ms.runAfter(() {
        game.startGame(nickname: nickname.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackdropBlur(
      colorOpacity: 0.1,
      child: Center(
        child: OverlayPanel(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '수학대왕 캐릭터 키우기',
                  style: TS.titleLarge,
                ),
                const Gap(24),
                const Text('캐릭터를 생성해주세요!'),
                const Gap(12),
                ClipRRect(
                  borderRadius: 999.bRadius,
                  child: CachedNetworkImage(
                      imageUrl: 'https://iili.io/JCm0irv.png', width: 120, height: 120, fit: BoxFit.cover),
                ),
                const Gap(12),
                TextButton.icon(onPressed: null, icon: Icon(MdiIcons.refresh), label: const Text('다시 생성하기')),
                const Gap(24),
                const Text('닉네임을 입력해주세요!'),
                SizedBox(
                  width: 240,
                  child: TextField(
                    controller: nickname,
                    decoration: const InputDecoration(hintText: '강해린'),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Gap(48),
                FilledButton.tonal(
                  onPressed: () {
                    game.startGame(nickname: nickname.text);
                  },
                  child: const Text('시작하기'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
