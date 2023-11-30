// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'walk_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalkRequest _$WalkRequestFromJson(Map<String, dynamic> json) {
  return _WalkRequest.fromJson(json);
}

/// @nodoc
mixin _$WalkRequest {
  String? get id => throw _privateConstructorUsedError;
  List<Dog>? get dogs => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  String? get acceptedBy => throw _privateConstructorUsedError;
  DateTime? get acceptedAt => throw _privateConstructorUsedError;
  DateTime? get canceledAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalkRequestCopyWith<WalkRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalkRequestCopyWith<$Res> {
  factory $WalkRequestCopyWith(
          WalkRequest value, $Res Function(WalkRequest) then) =
      _$WalkRequestCopyWithImpl<$Res, WalkRequest>;
  @useResult
  $Res call(
      {String? id,
      List<Dog>? dogs,
      double? longitude,
      double? latitude,
      String? acceptedBy,
      DateTime? acceptedAt,
      DateTime? canceledAt});
}

/// @nodoc
class _$WalkRequestCopyWithImpl<$Res, $Val extends WalkRequest>
    implements $WalkRequestCopyWith<$Res> {
  _$WalkRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? dogs = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? acceptedBy = freezed,
    Object? acceptedAt = freezed,
    Object? canceledAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      dogs: freezed == dogs
          ? _value.dogs
          : dogs // ignore: cast_nullable_to_non_nullable
              as List<Dog>?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      acceptedBy: freezed == acceptedBy
          ? _value.acceptedBy
          : acceptedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptedAt: freezed == acceptedAt
          ? _value.acceptedAt
          : acceptedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      canceledAt: freezed == canceledAt
          ? _value.canceledAt
          : canceledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalkRequestImplCopyWith<$Res>
    implements $WalkRequestCopyWith<$Res> {
  factory _$$WalkRequestImplCopyWith(
          _$WalkRequestImpl value, $Res Function(_$WalkRequestImpl) then) =
      __$$WalkRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      List<Dog>? dogs,
      double? longitude,
      double? latitude,
      String? acceptedBy,
      DateTime? acceptedAt,
      DateTime? canceledAt});
}

/// @nodoc
class __$$WalkRequestImplCopyWithImpl<$Res>
    extends _$WalkRequestCopyWithImpl<$Res, _$WalkRequestImpl>
    implements _$$WalkRequestImplCopyWith<$Res> {
  __$$WalkRequestImplCopyWithImpl(
      _$WalkRequestImpl _value, $Res Function(_$WalkRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? dogs = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? acceptedBy = freezed,
    Object? acceptedAt = freezed,
    Object? canceledAt = freezed,
  }) {
    return _then(_$WalkRequestImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      dogs: freezed == dogs
          ? _value._dogs
          : dogs // ignore: cast_nullable_to_non_nullable
              as List<Dog>?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      acceptedBy: freezed == acceptedBy
          ? _value.acceptedBy
          : acceptedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptedAt: freezed == acceptedAt
          ? _value.acceptedAt
          : acceptedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      canceledAt: freezed == canceledAt
          ? _value.canceledAt
          : canceledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalkRequestImpl with DiagnosticableTreeMixin implements _WalkRequest {
  const _$WalkRequestImpl(
      {this.id,
      final List<Dog>? dogs,
      this.longitude,
      this.latitude,
      this.acceptedBy,
      this.acceptedAt,
      this.canceledAt})
      : _dogs = dogs;

  factory _$WalkRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalkRequestImplFromJson(json);

  @override
  final String? id;
  final List<Dog>? _dogs;
  @override
  List<Dog>? get dogs {
    final value = _dogs;
    if (value == null) return null;
    if (_dogs is EqualUnmodifiableListView) return _dogs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? longitude;
  @override
  final double? latitude;
  @override
  final String? acceptedBy;
  @override
  final DateTime? acceptedAt;
  @override
  final DateTime? canceledAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalkRequest(id: $id, dogs: $dogs, longitude: $longitude, latitude: $latitude, acceptedBy: $acceptedBy, acceptedAt: $acceptedAt, canceledAt: $canceledAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WalkRequest'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('dogs', dogs))
      ..add(DiagnosticsProperty('longitude', longitude))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('acceptedBy', acceptedBy))
      ..add(DiagnosticsProperty('acceptedAt', acceptedAt))
      ..add(DiagnosticsProperty('canceledAt', canceledAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalkRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._dogs, _dogs) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.acceptedBy, acceptedBy) ||
                other.acceptedBy == acceptedBy) &&
            (identical(other.acceptedAt, acceptedAt) ||
                other.acceptedAt == acceptedAt) &&
            (identical(other.canceledAt, canceledAt) ||
                other.canceledAt == canceledAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_dogs),
      longitude,
      latitude,
      acceptedBy,
      acceptedAt,
      canceledAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalkRequestImplCopyWith<_$WalkRequestImpl> get copyWith =>
      __$$WalkRequestImplCopyWithImpl<_$WalkRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalkRequestImplToJson(
      this,
    );
  }
}

abstract class _WalkRequest implements WalkRequest {
  const factory _WalkRequest(
      {final String? id,
      final List<Dog>? dogs,
      final double? longitude,
      final double? latitude,
      final String? acceptedBy,
      final DateTime? acceptedAt,
      final DateTime? canceledAt}) = _$WalkRequestImpl;

  factory _WalkRequest.fromJson(Map<String, dynamic> json) =
      _$WalkRequestImpl.fromJson;

  @override
  String? get id;
  @override
  List<Dog>? get dogs;
  @override
  double? get longitude;
  @override
  double? get latitude;
  @override
  String? get acceptedBy;
  @override
  DateTime? get acceptedAt;
  @override
  DateTime? get canceledAt;
  @override
  @JsonKey(ignore: true)
  _$$WalkRequestImplCopyWith<_$WalkRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
