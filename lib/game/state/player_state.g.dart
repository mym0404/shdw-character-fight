// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerStateImpl _$$PlayerStateImplFromJson(Map<String, dynamic> json) =>
    _$PlayerStateImpl(
      isMe: json['isMe'] as bool,
      isActive: json['isActive'] as bool,
      nickname: json['nickname'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? 'https://iili.io/JCm0irv.png',
    );

Map<String, dynamic> _$$PlayerStateImplToJson(_$PlayerStateImpl instance) =>
    <String, dynamic>{
      'isMe': instance.isMe,
      'isActive': instance.isActive,
      'nickname': instance.nickname,
      'thumbnail': instance.thumbnail,
    };
