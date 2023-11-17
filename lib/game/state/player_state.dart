import '../../export.dart';

part 'player_state.freezed.dart';
part 'player_state.g.dart';

@freezed
class PlayerState with _$PlayerState {
  const PlayerState._();
  const factory PlayerState({required bool isMe}) = _PlayerState;

  factory PlayerState.fromJson(Map<String, dynamic> json) => _$PlayerStateFromJson(json);
}
