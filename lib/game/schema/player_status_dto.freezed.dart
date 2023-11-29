// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_status_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlayerStatusDto _$PlayerStatusDtoFromJson(Map<String, dynamic> json) {
  return _PlayerStatusDto.fromJson(json);
}

/// @nodoc
mixin _$PlayerStatusDto {
  String get userId => throw _privateConstructorUsedError;
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  int get exp => throw _privateConstructorUsedError;
  int get hp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerStatusDtoCopyWith<PlayerStatusDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerStatusDtoCopyWith<$Res> {
  factory $PlayerStatusDtoCopyWith(
          PlayerStatusDto value, $Res Function(PlayerStatusDto) then) =
      _$PlayerStatusDtoCopyWithImpl<$Res, PlayerStatusDto>;
  @useResult
  $Res call({String userId, double x, double y, int exp, int hp});
}

/// @nodoc
class _$PlayerStatusDtoCopyWithImpl<$Res, $Val extends PlayerStatusDto>
    implements $PlayerStatusDtoCopyWith<$Res> {
  _$PlayerStatusDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? x = null,
    Object? y = null,
    Object? exp = null,
    Object? hp = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      hp: null == hp
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerStatusDtoImplCopyWith<$Res>
    implements $PlayerStatusDtoCopyWith<$Res> {
  factory _$$PlayerStatusDtoImplCopyWith(_$PlayerStatusDtoImpl value,
          $Res Function(_$PlayerStatusDtoImpl) then) =
      __$$PlayerStatusDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, double x, double y, int exp, int hp});
}

/// @nodoc
class __$$PlayerStatusDtoImplCopyWithImpl<$Res>
    extends _$PlayerStatusDtoCopyWithImpl<$Res, _$PlayerStatusDtoImpl>
    implements _$$PlayerStatusDtoImplCopyWith<$Res> {
  __$$PlayerStatusDtoImplCopyWithImpl(
      _$PlayerStatusDtoImpl _value, $Res Function(_$PlayerStatusDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? x = null,
    Object? y = null,
    Object? exp = null,
    Object? hp = null,
  }) {
    return _then(_$PlayerStatusDtoImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      hp: null == hp
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerStatusDtoImpl extends _PlayerStatusDto
    with DiagnosticableTreeMixin {
  const _$PlayerStatusDtoImpl(
      {required this.userId,
      required this.x,
      required this.y,
      required this.exp,
      required this.hp})
      : super._();

  factory _$PlayerStatusDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerStatusDtoImplFromJson(json);

  @override
  final String userId;
  @override
  final double x;
  @override
  final double y;
  @override
  final int exp;
  @override
  final int hp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerStatusDto(userId: $userId, x: $x, y: $y, exp: $exp, hp: $hp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerStatusDto'))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('x', x))
      ..add(DiagnosticsProperty('y', y))
      ..add(DiagnosticsProperty('exp', exp))
      ..add(DiagnosticsProperty('hp', hp));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerStatusDtoImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.exp, exp) || other.exp == exp) &&
            (identical(other.hp, hp) || other.hp == hp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, x, y, exp, hp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerStatusDtoImplCopyWith<_$PlayerStatusDtoImpl> get copyWith =>
      __$$PlayerStatusDtoImplCopyWithImpl<_$PlayerStatusDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerStatusDtoImplToJson(
      this,
    );
  }
}

abstract class _PlayerStatusDto extends PlayerStatusDto {
  const factory _PlayerStatusDto(
      {required final String userId,
      required final double x,
      required final double y,
      required final int exp,
      required final int hp}) = _$PlayerStatusDtoImpl;
  const _PlayerStatusDto._() : super._();

  factory _PlayerStatusDto.fromJson(Map<String, dynamic> json) =
      _$PlayerStatusDtoImpl.fromJson;

  @override
  String get userId;
  @override
  double get x;
  @override
  double get y;
  @override
  int get exp;
  @override
  int get hp;
  @override
  @JsonKey(ignore: true)
  _$$PlayerStatusDtoImplCopyWith<_$PlayerStatusDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
