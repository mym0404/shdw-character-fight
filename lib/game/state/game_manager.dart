import 'package:uuid/uuid.dart';

import '../../export.dart';
import 'game_channel_state.dart';
import 'game_state.dart';
import 'player_state.dart';

class GameManager {
  BS<GameState> state = BS.seeded(const GameState());
  BS<PlayerState> me = BS.seeded(PlayerState(id: const Uuid().v4()));
  GameChannelState channel = GameChannelState();
  // BS<List<PlayerState>> others = channel;

  void startGame() {
    state.value = state.value.copyWith(isGameStarted: true);
  }

  void setMeProfile({required String nickname}) {
    me.value = me.value.copyWith(nickname: nickname);
  }
}
