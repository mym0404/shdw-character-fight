import '../../export.dart';

part 'player_dead_dto.freezed.dart';
part 'player_dead_dto.g.dart';

@freezed
class PlayerDeadDto with _$PlayerDeadDto {
  const PlayerDeadDto._();
  const factory PlayerDeadDto({required String id}) = _PlayerDeadDto;

  factory PlayerDeadDto.fromJson(Map<String, dynamic> json) => _$PlayerDeadDtoFromJson(json);
}
