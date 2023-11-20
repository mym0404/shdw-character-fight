// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlayerPosition _$PlayerPositionFromJson(Map<String, dynamic> json) {
  return _PlayerPosition.fromJson(json);
}

/// @nodoc
mixin _$PlayerPosition {
  String get userId => throw _privateConstructorUsedError;
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerPositionCopyWith<PlayerPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerPositionCopyWith<$Res> {
  factory $PlayerPositionCopyWith(
          PlayerPosition value, $Res Function(PlayerPosition) then) =
      _$PlayerPositionCopyWithImpl<$Res, PlayerPosition>;
  @useResult
  $Res call({String userId, double x, double y});
}

/// @nodoc
class _$PlayerPositionCopyWithImpl<$Res, $Val extends PlayerPosition>
    implements $PlayerPositionCopyWith<$Res> {
  _$PlayerPositionCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerPositionImplCopyWith<$Res>
    implements $PlayerPositionCopyWith<$Res> {
  factory _$$PlayerPositionImplCopyWith(_$PlayerPositionImpl value,
          $Res Function(_$PlayerPositionImpl) then) =
      __$$PlayerPositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, double x, double y});
}

/// @nodoc
class __$$PlayerPositionImplCopyWithImpl<$Res>
    extends _$PlayerPositionCopyWithImpl<$Res, _$PlayerPositionImpl>
    implements _$$PlayerPositionImplCopyWith<$Res> {
  __$$PlayerPositionImplCopyWithImpl(
      _$PlayerPositionImpl _value, $Res Function(_$PlayerPositionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_$PlayerPositionImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerPositionImpl extends _PlayerPosition
    with DiagnosticableTreeMixin {
  const _$PlayerPositionImpl(
      {required this.userId, required this.x, required this.y})
      : super._();

  factory _$PlayerPositionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerPositionImplFromJson(json);

  @override
  final String userId;
  @override
  final double x;
  @override
  final double y;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerPosition(userId: $userId, x: $x, y: $y)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerPosition'))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('x', x))
      ..add(DiagnosticsProperty('y', y));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerPositionImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, x, y);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerPositionImplCopyWith<_$PlayerPositionImpl> get copyWith =>
      __$$PlayerPositionImplCopyWithImpl<_$PlayerPositionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerPositionImplToJson(
      this,
    );
  }
}

abstract class _PlayerPosition extends PlayerPosition {
  const factory _PlayerPosition(
      {required final String userId,
      required final double x,
      required final double y}) = _$PlayerPositionImpl;
  const _PlayerPosition._() : super._();

  factory _PlayerPosition.fromJson(Map<String, dynamic> json) =
      _$PlayerPositionImpl.fromJson;

  @override
  String get userId;
  @override
  double get x;
  @override
  double get y;
  @override
  @JsonKey(ignore: true)
  _$$PlayerPositionImplCopyWith<_$PlayerPositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
