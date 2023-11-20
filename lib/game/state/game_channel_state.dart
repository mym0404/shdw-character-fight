import '../../export.dart';
import 'player_state.dart';

class GameChannelState extends ChangeNotifier {
  GameChannelState();

  BS<Map<String, PlayerState>> players = BS.seeded({});
}
