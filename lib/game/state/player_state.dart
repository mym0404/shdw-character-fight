import '../../export.dart';

part 'player_state.freezed.dart';
part 'player_state.g.dart';

@freezed
class PlayerState with _$PlayerState {
  const PlayerState._();
  const factory PlayerState({
    required String id,
    @Default('') String nickname,
    required String thumbnail,
    @Default(0) int exp,
    @Default(0) int hp,
    @Default(0.0) double x,
    @Default(0.0) double y,
  }) = _PlayerState;

  factory PlayerState.fromJson(Map<String, dynamic> json) => _$PlayerStateFromJson(json);
}
