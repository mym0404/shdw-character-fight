import 'package:uuid/uuid.dart';

import '../../export.dart';
import '../util/level_manager.dart';
import 'game_channel_state.dart';
import 'game_state.dart';
import 'player_state.dart';

class GameManager {
  VAL<GameState> state = VAL(const GameState());
  VAL<PlayerState> me = VAL(PlayerState(id: const Uuid().v4(), hp: LevelManager.hpForEachLevel[0]));
  GameChannelState channel = GameChannelState();
  // BS<List<PlayerState>> others = channel;

  void startGame() {
    state.value = state.value.copyWith(isGameStarted: true);
  }

  void setMeProfile({required String nickname}) {
    me.value = me.value.copyWith(nickname: nickname);
  }
}
