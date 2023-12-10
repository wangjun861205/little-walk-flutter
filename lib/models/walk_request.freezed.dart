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
  String get id => throw _privateConstructorUsedError;
  List<Dog> get dogs => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: "accepted_by")
  String? get acceptedBy => throw _privateConstructorUsedError;
  @JsonKey(name: "accepted_at")
  DateTime? get acceptedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "canceled_at")
  DateTime? get canceledAt => throw _privateConstructorUsedError;
  @JsonKey(name: "started_at")
  DateTime? get startedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "finished_at")
  DateTime? get finishedAt => throw _privateConstructorUsedError;

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
      {String id,
      List<Dog> dogs,
      double longitude,
      double latitude,
      @JsonKey(name: "accepted_by") String? acceptedBy,
      @JsonKey(name: "accepted_at") DateTime? acceptedAt,
      @JsonKey(name: "canceled_at") DateTime? canceledAt,
      @JsonKey(name: "started_at") DateTime? startedAt,
      @JsonKey(name: "finished_at") DateTime? finishedAt});
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
    Object? id = null,
    Object? dogs = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? acceptedBy = freezed,
    Object? acceptedAt = freezed,
    Object? canceledAt = freezed,
    Object? startedAt = freezed,
    Object? finishedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dogs: null == dogs
          ? _value.dogs
          : dogs // ignore: cast_nullable_to_non_nullable
              as List<Dog>,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
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
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
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
      {String id,
      List<Dog> dogs,
      double longitude,
      double latitude,
      @JsonKey(name: "accepted_by") String? acceptedBy,
      @JsonKey(name: "accepted_at") DateTime? acceptedAt,
      @JsonKey(name: "canceled_at") DateTime? canceledAt,
      @JsonKey(name: "started_at") DateTime? startedAt,
      @JsonKey(name: "finished_at") DateTime? finishedAt});
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
    Object? id = null,
    Object? dogs = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? acceptedBy = freezed,
    Object? acceptedAt = freezed,
    Object? canceledAt = freezed,
    Object? startedAt = freezed,
    Object? finishedAt = freezed,
  }) {
    return _then(_$WalkRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dogs: null == dogs
          ? _value._dogs
          : dogs // ignore: cast_nullable_to_non_nullable
              as List<Dog>,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
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
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalkRequestImpl with DiagnosticableTreeMixin implements _WalkRequest {
  const _$WalkRequestImpl(
      {required this.id,
      required final List<Dog> dogs,
      required this.longitude,
      required this.latitude,
      @JsonKey(name: "accepted_by") this.acceptedBy,
      @JsonKey(name: "accepted_at") this.acceptedAt,
      @JsonKey(name: "canceled_at") this.canceledAt,
      @JsonKey(name: "started_at") this.startedAt,
      @JsonKey(name: "finished_at") this.finishedAt})
      : _dogs = dogs;

  factory _$WalkRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalkRequestImplFromJson(json);

  @override
  final String id;
  final List<Dog> _dogs;
  @override
  List<Dog> get dogs {
    if (_dogs is EqualUnmodifiableListView) return _dogs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dogs);
  }

  @override
  final double longitude;
  @override
  final double latitude;
  @override
  @JsonKey(name: "accepted_by")
  final String? acceptedBy;
  @override
  @JsonKey(name: "accepted_at")
  final DateTime? acceptedAt;
  @override
  @JsonKey(name: "canceled_at")
  final DateTime? canceledAt;
  @override
  @JsonKey(name: "started_at")
  final DateTime? startedAt;
  @override
  @JsonKey(name: "finished_at")
  final DateTime? finishedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalkRequest(id: $id, dogs: $dogs, longitude: $longitude, latitude: $latitude, acceptedBy: $acceptedBy, acceptedAt: $acceptedAt, canceledAt: $canceledAt, startedAt: $startedAt, finishedAt: $finishedAt)';
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
      ..add(DiagnosticsProperty('canceledAt', canceledAt))
      ..add(DiagnosticsProperty('startedAt', startedAt))
      ..add(DiagnosticsProperty('finishedAt', finishedAt));
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
                other.canceledAt == canceledAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt));
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
      canceledAt,
      startedAt,
      finishedAt);

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
          {required final String id,
          required final List<Dog> dogs,
          required final double longitude,
          required final double latitude,
          @JsonKey(name: "accepted_by") final String? acceptedBy,
          @JsonKey(name: "accepted_at") final DateTime? acceptedAt,
          @JsonKey(name: "canceled_at") final DateTime? canceledAt,
          @JsonKey(name: "started_at") final DateTime? startedAt,
          @JsonKey(name: "finished_at") final DateTime? finishedAt}) =
      _$WalkRequestImpl;

  factory _WalkRequest.fromJson(Map<String, dynamic> json) =
      _$WalkRequestImpl.fromJson;

  @override
  String get id;
  @override
  List<Dog> get dogs;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  @JsonKey(name: "accepted_by")
  String? get acceptedBy;
  @override
  @JsonKey(name: "accepted_at")
  DateTime? get acceptedAt;
  @override
  @JsonKey(name: "canceled_at")
  DateTime? get canceledAt;
  @override
  @JsonKey(name: "started_at")
  DateTime? get startedAt;
  @override
  @JsonKey(name: "finished_at")
  DateTime? get finishedAt;
  @override
  @JsonKey(ignore: true)
  _$$WalkRequestImplCopyWith<_$WalkRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WalkRequestValue _$WalkRequestValueFromJson(Map<String, dynamic> json) {
  return _WalkRequestValue.fromJson(json);
}

/// @nodoc
mixin _$WalkRequestValue {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "dog_ids")
  List<String>? get dogIDs => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalkRequestValueCopyWith<WalkRequestValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalkRequestValueCopyWith<$Res> {
  factory $WalkRequestValueCopyWith(
          WalkRequestValue value, $Res Function(WalkRequestValue) then) =
      _$WalkRequestValueCopyWithImpl<$Res, WalkRequestValue>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: "dog_ids") List<String>? dogIDs,
      double? longitude,
      double? latitude});
}

/// @nodoc
class _$WalkRequestValueCopyWithImpl<$Res, $Val extends WalkRequestValue>
    implements $WalkRequestValueCopyWith<$Res> {
  _$WalkRequestValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? dogIDs = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      dogIDs: freezed == dogIDs
          ? _value.dogIDs
          : dogIDs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalkRequestValueImplCopyWith<$Res>
    implements $WalkRequestValueCopyWith<$Res> {
  factory _$$WalkRequestValueImplCopyWith(_$WalkRequestValueImpl value,
          $Res Function(_$WalkRequestValueImpl) then) =
      __$$WalkRequestValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: "dog_ids") List<String>? dogIDs,
      double? longitude,
      double? latitude});
}

/// @nodoc
class __$$WalkRequestValueImplCopyWithImpl<$Res>
    extends _$WalkRequestValueCopyWithImpl<$Res, _$WalkRequestValueImpl>
    implements _$$WalkRequestValueImplCopyWith<$Res> {
  __$$WalkRequestValueImplCopyWithImpl(_$WalkRequestValueImpl _value,
      $Res Function(_$WalkRequestValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? dogIDs = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
  }) {
    return _then(_$WalkRequestValueImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      dogIDs: freezed == dogIDs
          ? _value._dogIDs
          : dogIDs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalkRequestValueImpl
    with DiagnosticableTreeMixin
    implements _WalkRequestValue {
  const _$WalkRequestValueImpl(
      {this.id,
      @JsonKey(name: "dog_ids") final List<String>? dogIDs,
      this.longitude,
      this.latitude})
      : _dogIDs = dogIDs;

  factory _$WalkRequestValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalkRequestValueImplFromJson(json);

  @override
  final String? id;
  final List<String>? _dogIDs;
  @override
  @JsonKey(name: "dog_ids")
  List<String>? get dogIDs {
    final value = _dogIDs;
    if (value == null) return null;
    if (_dogIDs is EqualUnmodifiableListView) return _dogIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? longitude;
  @override
  final double? latitude;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalkRequestValue(id: $id, dogIDs: $dogIDs, longitude: $longitude, latitude: $latitude)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WalkRequestValue'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('dogIDs', dogIDs))
      ..add(DiagnosticsProperty('longitude', longitude))
      ..add(DiagnosticsProperty('latitude', latitude));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalkRequestValueImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._dogIDs, _dogIDs) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id,
      const DeepCollectionEquality().hash(_dogIDs), longitude, latitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalkRequestValueImplCopyWith<_$WalkRequestValueImpl> get copyWith =>
      __$$WalkRequestValueImplCopyWithImpl<_$WalkRequestValueImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalkRequestValueImplToJson(
      this,
    );
  }
}

abstract class _WalkRequestValue implements WalkRequestValue {
  const factory _WalkRequestValue(
      {final String? id,
      @JsonKey(name: "dog_ids") final List<String>? dogIDs,
      final double? longitude,
      final double? latitude}) = _$WalkRequestValueImpl;

  factory _WalkRequestValue.fromJson(Map<String, dynamic> json) =
      _$WalkRequestValueImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: "dog_ids")
  List<String>? get dogIDs;
  @override
  double? get longitude;
  @override
  double? get latitude;
  @override
  @JsonKey(ignore: true)
  _$$WalkRequestValueImplCopyWith<_$WalkRequestValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
