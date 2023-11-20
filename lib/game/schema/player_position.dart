import '../../export.dart';

part 'player_position.freezed.dart';
part 'player_position.g.dart';

@freezed
class PlayerPosition with _$PlayerPosition {
  const PlayerPosition._();
  const factory PlayerPosition({
    required String userId,
    required double x,
    required double y,
  }) = _PlayerPosition;

  factory PlayerPosition.fromJson(Map<String, dynamic> json) => _$PlayerPositionFromJson(json);
}
