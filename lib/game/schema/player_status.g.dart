// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerStatusImpl _$$PlayerStatusImplFromJson(Map<String, dynamic> json) =>
    _$PlayerStatusImpl(
      userId: json['userId'] as String,
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      exp: json['exp'] as int,
      hp: json['hp'] as int,
    );

Map<String, dynamic> _$$PlayerStatusImplToJson(_$PlayerStatusImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'x': instance.x,
      'y': instance.y,
      'exp': instance.exp,
      'hp': instance.hp,
    };
