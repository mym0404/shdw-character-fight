// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlayerStatus _$PlayerStatusFromJson(Map<String, dynamic> json) {
  return _PlayerStatus.fromJson(json);
}

/// @nodoc
mixin _$PlayerStatus {
  String get userId => throw _privateConstructorUsedError;
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  int get exp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerStatusCopyWith<PlayerStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerStatusCopyWith<$Res> {
  factory $PlayerStatusCopyWith(
          PlayerStatus value, $Res Function(PlayerStatus) then) =
      _$PlayerStatusCopyWithImpl<$Res, PlayerStatus>;
  @useResult
  $Res call({String userId, double x, double y, int exp});
}

/// @nodoc
class _$PlayerStatusCopyWithImpl<$Res, $Val extends PlayerStatus>
    implements $PlayerStatusCopyWith<$Res> {
  _$PlayerStatusCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerStatusImplCopyWith<$Res>
    implements $PlayerStatusCopyWith<$Res> {
  factory _$$PlayerStatusImplCopyWith(
          _$PlayerStatusImpl value, $Res Function(_$PlayerStatusImpl) then) =
      __$$PlayerStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, double x, double y, int exp});
}

/// @nodoc
class __$$PlayerStatusImplCopyWithImpl<$Res>
    extends _$PlayerStatusCopyWithImpl<$Res, _$PlayerStatusImpl>
    implements _$$PlayerStatusImplCopyWith<$Res> {
  __$$PlayerStatusImplCopyWithImpl(
      _$PlayerStatusImpl _value, $Res Function(_$PlayerStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? x = null,
    Object? y = null,
    Object? exp = null,
  }) {
    return _then(_$PlayerStatusImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerStatusImpl extends _PlayerStatus with DiagnosticableTreeMixin {
  const _$PlayerStatusImpl(
      {required this.userId,
      required this.x,
      required this.y,
      required this.exp})
      : super._();

  factory _$PlayerStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerStatusImplFromJson(json);

  @override
  final String userId;
  @override
  final double x;
  @override
  final double y;
  @override
  final int exp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerStatus(userId: $userId, x: $x, y: $y, exp: $exp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerStatus'))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('x', x))
      ..add(DiagnosticsProperty('y', y))
      ..add(DiagnosticsProperty('exp', exp));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerStatusImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.exp, exp) || other.exp == exp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, x, y, exp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerStatusImplCopyWith<_$PlayerStatusImpl> get copyWith =>
      __$$PlayerStatusImplCopyWithImpl<_$PlayerStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerStatusImplToJson(
      this,
    );
  }
}

abstract class _PlayerStatus extends PlayerStatus {
  const factory _PlayerStatus(
      {required final String userId,
      required final double x,
      required final double y,
      required final int exp}) = _$PlayerStatusImpl;
  const _PlayerStatus._() : super._();

  factory _PlayerStatus.fromJson(Map<String, dynamic> json) =
      _$PlayerStatusImpl.fromJson;

  @override
  String get userId;
  @override
  double get x;
  @override
  double get y;
  @override
  int get exp;
  @override
  @JsonKey(ignore: true)
  _$$PlayerStatusImplCopyWith<_$PlayerStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
