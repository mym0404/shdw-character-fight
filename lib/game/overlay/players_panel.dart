import '../../export.dart';
import '../../feature/common/widget/overlay_panel.dart';
import '../state/game_manager.dart';
import '../state/player_state.dart';

class PlayersPanel extends WatchingWidget {
  const PlayersPanel({super.key});

  @override
  Widget build(BuildContext context) {
    var players = watchValue((GameManager p0) => p0.channel.players);
    var me = watchValue((GameManager p0) => p0.me);
    List<PlayerState> merged = [...players.values, me].sorted((a, b) => b.exp - a.exp);

    return SizedBox(
      width: 200,
      child: OverlayPanel(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Players',
              style: TS.titleMedium,
            ),
            const Gap(20),
            for (int i = 0; i < merged.length; i++)
              Row(
                children: [
                  Text('${i + 1}. '),
                  Expanded(child: Text(merged[i].nickname)),
                  Text('${merged[i].exp}')
                ],
              )
          ],
        ),
      ),
    );
  }
}
