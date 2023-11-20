// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerPositionImpl _$$PlayerPositionImplFromJson(Map<String, dynamic> json) =>
    _$PlayerPositionImpl(
      userId: json['userId'] as String,
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
    );

Map<String, dynamic> _$$PlayerPositionImplToJson(
        _$PlayerPositionImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'x': instance.x,
      'y': instance.y,
    };
