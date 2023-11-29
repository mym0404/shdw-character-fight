// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerStateImpl _$$PlayerStateImplFromJson(Map<String, dynamic> json) =>
    _$PlayerStateImpl(
      id: json['id'] as String,
      nickname: json['nickname'] as String? ?? '',
      thumbnail: json['thumbnail'] as String,
      exp: json['exp'] as int,
      hp: json['hp'] as int,
      x: (json['x'] as num?)?.toDouble() ?? 0.0,
      y: (json['y'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$PlayerStateImplToJson(_$PlayerStateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'thumbnail': instance.thumbnail,
      'exp': instance.exp,
      'hp': instance.hp,
      'x': instance.x,
      'y': instance.y,
    };
