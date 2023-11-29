// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerStatusDtoImpl _$$PlayerStatusDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PlayerStatusDtoImpl(
      userId: json['userId'] as String,
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      exp: json['exp'] as int,
      hp: json['hp'] as int,
    );

Map<String, dynamic> _$$PlayerStatusDtoImplToJson(
        _$PlayerStatusDtoImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'x': instance.x,
      'y': instance.y,
      'exp': instance.exp,
      'hp': instance.hp,
    };
