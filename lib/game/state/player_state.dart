import '../../export.dart';
import '../util/level_manager.dart';

part 'player_state.freezed.dart';
part 'player_state.g.dart';

@freezed
class PlayerState with _$PlayerState {
  const PlayerState._();
  const factory PlayerState({
    required String id,
    @Default('') String nickname,
    required String thumbnail,
    required int exp,
    required int hp,
    @Default(0.0) double x,
    @Default(0.0) double y,
  }) = _PlayerState;

  int get level => LevelManager.expToLevel(this.exp).$1;

  factory PlayerState.fromJson(Map<String, dynamic> json) => _$PlayerStateFromJson(json);
}
