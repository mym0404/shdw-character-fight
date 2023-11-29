import '../../export.dart';
import '../socket/channel_manager.dart';

part 'broadcast_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class BroadcastDto {
  BroadcastDto(this.event, this.payload);
  final GameEvent event;
  Json? payload;

  factory BroadcastDto.fromJson(Map<String, dynamic> json) => _$BroadcastDtoFromJson(json);
  Json toJson() => _$BroadcastDtoToJson(this);
}
