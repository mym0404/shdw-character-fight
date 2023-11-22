import '../../export.dart';
import 'player_state.dart';

class GameChannelState extends ChangeNotifier {
  GameChannelState();

  VAL<Map<String, PlayerState>> players = VAL({});
}
