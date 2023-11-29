import '../../export.dart';

part 'player_status_dto.freezed.dart';
part 'player_status_dto.g.dart';

@freezed
class PlayerStatusDto with _$PlayerStatusDto {
  const PlayerStatusDto._();
  const factory PlayerStatusDto({
    required String userId,
    required double x,
    required double y,
    required int exp,
    required int hp,
  }) = _PlayerStatusDto;

  factory PlayerStatusDto.fromJson(Map<String, dynamic> json) => _$PlayerStatusDtoFromJson(json);
}
