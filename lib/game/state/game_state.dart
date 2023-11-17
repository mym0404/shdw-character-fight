import '../../export.dart';
import 'player_state.dart';

part 'game_state.freezed.dart';
part 'game_state.g.dart';

@freezed
class GameState with _$GameState {
  const GameState._();
  const factory GameState({
    @Default(false) bool isGameStarted,
  }) = _GameState;

  factory GameState.fromJson(Map<String, dynamic> json) => _$GameStateFromJson(json);
}

class GameManager {
  BehaviorSubject<GameState> state = BehaviorSubject.seeded(const GameState());
  BehaviorSubject<PlayerState> me = BS.seeded(PlayerState(isMe: true, isActive: false));

  void startGame() {
    state.value = state.value.copyWith(isGameStarted: true);
  }

  void setMeProfile({required String nickname}) {
    me.value = me.value.copyWith(nickname: nickname);
  }
}
