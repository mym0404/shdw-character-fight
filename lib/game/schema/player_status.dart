import '../../export.dart';

part 'player_status.freezed.dart';
part 'player_status.g.dart';

@freezed
class PlayerStatus with _$PlayerStatus {
  const PlayerStatus._();
  const factory PlayerStatus({
    required String userId,
    required double x,
    required double y,
    required int exp,
    required int hp,
  }) = _PlayerStatus;

  factory PlayerStatus.fromJson(Map<String, dynamic> json) => _$PlayerStatusFromJson(json);
}
