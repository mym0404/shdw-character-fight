import 'package:cached_network_image/cached_network_image.dart';

import '../../export.dart';
import '../../feature/common/widget/overlay_panel.dart';
import '../state/game_manager.dart';
import '../util/level_manager.dart';

class PlayerStatusPanel extends StatelessWidget with WatchItMixin {
  const PlayerStatusPanel({super.key});

  @override
  Widget build(BuildContext context) {
    var me = watchValue((GameManager e) => e.me);
    log.i(me);

    return SizedBox(
      width: 200,
      child: OverlayPanel(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Status', style: TS.bodyMedium),
            const Gap(20),
            Row(
              children: [
                ClipRRect(
                  borderRadius: 20.bRadius,
                  child: CachedNetworkImage(
                    imageUrl: me.thumbnail,
                    width: 40,
                    height: 40,
                  ),
                ),
                const Gap(12),
                Text(me.nickname),
              ],
            ),
            const Gap(12),
            Text('HP (${me.hp}/${LevelManager.maxHpByExp(me.exp)})'),
            const Gap(4),
            FullWidth(
              child: Container(
                height: 8,
                color: Colors.grey,
                padding: const EdgeInsets.all(1),
                child: CenterLeft(
                  child: AnimatedFractionallySizedBox(
                    duration: 500.ms,
                    widthFactor: me.hp / LevelManager.maxHpByExp(me.exp),
                    child: Container(decoration: const BoxDecoration(color: Colors.redAccent)),
                  ),
                ),
              ),
            ),
            const Gap(12),
            Text('LEVEL: ${LevelManager.expToLevel(me.exp).$1}'),
            const Gap(4),
            if (LevelManager.isMaxLevel(me.exp))
              const Text('EXP (MAX)')
            else
              Text(
                'EXP (${LevelManager.expInCurrentLevel(me.exp)}/${LevelManager.nextLevelRequiredExp(me.exp)})',
              ),
            const Gap(4),
            FullWidth(
              child: Container(
                height: 8,
                color: Colors.grey,
                padding: const EdgeInsets.all(1),
                child: CenterLeft(
                  child: AnimatedFractionallySizedBox(
                    duration: 500.ms,
                    widthFactor: me.exp / LevelManager.nextLevelRequiredExp(me.exp),
                    child: Container(decoration: const BoxDecoration(color: Colors.amber)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
