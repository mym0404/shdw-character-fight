// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'broadcast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BroadcastDto _$BroadcastDtoFromJson(Map<String, dynamic> json) => BroadcastDto(
      $enumDecode(_$GameEventEnumMap, json['event']),
      json['payload'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$BroadcastDtoToJson(BroadcastDto instance) =>
    <String, dynamic>{
      'event': _$GameEventEnumMap[instance.event]!,
      'payload': instance.payload,
    };

const _$GameEventEnumMap = {
  GameEvent.playerStatus: 'playerStatus',
  GameEvent.playerDead: 'playerDead',
};
