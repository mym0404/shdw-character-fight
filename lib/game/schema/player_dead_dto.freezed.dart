// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_dead_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlayerDeadDto _$PlayerDeadDtoFromJson(Map<String, dynamic> json) {
  return _PlayerDeadDto.fromJson(json);
}

/// @nodoc
mixin _$PlayerDeadDto {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerDeadDtoCopyWith<PlayerDeadDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerDeadDtoCopyWith<$Res> {
  factory $PlayerDeadDtoCopyWith(
          PlayerDeadDto value, $Res Function(PlayerDeadDto) then) =
      _$PlayerDeadDtoCopyWithImpl<$Res, PlayerDeadDto>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$PlayerDeadDtoCopyWithImpl<$Res, $Val extends PlayerDeadDto>
    implements $PlayerDeadDtoCopyWith<$Res> {
  _$PlayerDeadDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerDeadDtoImplCopyWith<$Res>
    implements $PlayerDeadDtoCopyWith<$Res> {
  factory _$$PlayerDeadDtoImplCopyWith(
          _$PlayerDeadDtoImpl value, $Res Function(_$PlayerDeadDtoImpl) then) =
      __$$PlayerDeadDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$PlayerDeadDtoImplCopyWithImpl<$Res>
    extends _$PlayerDeadDtoCopyWithImpl<$Res, _$PlayerDeadDtoImpl>
    implements _$$PlayerDeadDtoImplCopyWith<$Res> {
  __$$PlayerDeadDtoImplCopyWithImpl(
      _$PlayerDeadDtoImpl _value, $Res Function(_$PlayerDeadDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$PlayerDeadDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerDeadDtoImpl extends _PlayerDeadDto with DiagnosticableTreeMixin {
  const _$PlayerDeadDtoImpl({required this.id}) : super._();

  factory _$PlayerDeadDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerDeadDtoImplFromJson(json);

  @override
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerDeadDto(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerDeadDto'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerDeadDtoImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerDeadDtoImplCopyWith<_$PlayerDeadDtoImpl> get copyWith =>
      __$$PlayerDeadDtoImplCopyWithImpl<_$PlayerDeadDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerDeadDtoImplToJson(
      this,
    );
  }
}

abstract class _PlayerDeadDto extends PlayerDeadDto {
  const factory _PlayerDeadDto({required final String id}) =
      _$PlayerDeadDtoImpl;
  const _PlayerDeadDto._() : super._();

  factory _PlayerDeadDto.fromJson(Map<String, dynamic> json) =
      _$PlayerDeadDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$PlayerDeadDtoImplCopyWith<_$PlayerDeadDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
