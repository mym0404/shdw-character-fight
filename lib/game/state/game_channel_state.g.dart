// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_channel_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameChannelState _$GameChannelStateFromJson(Map<String, dynamic> json) =>
    GameChannelState()
      ..players = (json['players'] as List<dynamic>)
          .map((e) => PlayerState.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GameChannelStateToJson(GameChannelState instance) =>
    <String, dynamic>{
      'players': instance.players,
    };
