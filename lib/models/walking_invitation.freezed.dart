// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'walking_invitation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalkingInvitation _$WalkingInvitationFromJson(Map<String, dynamic> json) {
  return _WalkingInvitation.fromJson(json);
}

/// @nodoc
mixin _$WalkingInvitation {
  String get id => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  DateTime get estimatedStartTime => throw _privateConstructorUsedError;
  List<Dog> get dogs => throw _privateConstructorUsedError;
  Owner get initiator => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalkingInvitationCopyWith<WalkingInvitation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalkingInvitationCopyWith<$Res> {
  factory $WalkingInvitationCopyWith(
          WalkingInvitation value, $Res Function(WalkingInvitation) then) =
      _$WalkingInvitationCopyWithImpl<$Res, WalkingInvitation>;
  @useResult
  $Res call(
      {String id,
      double longitude,
      double latitude,
      DateTime estimatedStartTime,
      List<Dog> dogs,
      Owner initiator});

  $OwnerCopyWith<$Res> get initiator;
}

/// @nodoc
class _$WalkingInvitationCopyWithImpl<$Res, $Val extends WalkingInvitation>
    implements $WalkingInvitationCopyWith<$Res> {
  _$WalkingInvitationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? estimatedStartTime = null,
    Object? dogs = null,
    Object? initiator = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      estimatedStartTime: null == estimatedStartTime
          ? _value.estimatedStartTime
          : estimatedStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dogs: null == dogs
          ? _value.dogs
          : dogs // ignore: cast_nullable_to_non_nullable
              as List<Dog>,
      initiator: null == initiator
          ? _value.initiator
          : initiator // ignore: cast_nullable_to_non_nullable
              as Owner,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OwnerCopyWith<$Res> get initiator {
    return $OwnerCopyWith<$Res>(_value.initiator, (value) {
      return _then(_value.copyWith(initiator: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WalkingInvitationImplCopyWith<$Res>
    implements $WalkingInvitationCopyWith<$Res> {
  factory _$$WalkingInvitationImplCopyWith(_$WalkingInvitationImpl value,
          $Res Function(_$WalkingInvitationImpl) then) =
      __$$WalkingInvitationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double longitude,
      double latitude,
      DateTime estimatedStartTime,
      List<Dog> dogs,
      Owner initiator});

  @override
  $OwnerCopyWith<$Res> get initiator;
}

/// @nodoc
class __$$WalkingInvitationImplCopyWithImpl<$Res>
    extends _$WalkingInvitationCopyWithImpl<$Res, _$WalkingInvitationImpl>
    implements _$$WalkingInvitationImplCopyWith<$Res> {
  __$$WalkingInvitationImplCopyWithImpl(_$WalkingInvitationImpl _value,
      $Res Function(_$WalkingInvitationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? estimatedStartTime = null,
    Object? dogs = null,
    Object? initiator = null,
  }) {
    return _then(_$WalkingInvitationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      estimatedStartTime: null == estimatedStartTime
          ? _value.estimatedStartTime
          : estimatedStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dogs: null == dogs
          ? _value._dogs
          : dogs // ignore: cast_nullable_to_non_nullable
              as List<Dog>,
      initiator: null == initiator
          ? _value.initiator
          : initiator // ignore: cast_nullable_to_non_nullable
              as Owner,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalkingInvitationImpl implements _WalkingInvitation {
  const _$WalkingInvitationImpl(
      {required this.id,
      required this.longitude,
      required this.latitude,
      required this.estimatedStartTime,
      required final List<Dog> dogs,
      required this.initiator})
      : _dogs = dogs;

  factory _$WalkingInvitationImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalkingInvitationImplFromJson(json);

  @override
  final String id;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final DateTime estimatedStartTime;
  final List<Dog> _dogs;
  @override
  List<Dog> get dogs {
    if (_dogs is EqualUnmodifiableListView) return _dogs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dogs);
  }

  @override
  final Owner initiator;

  @override
  String toString() {
    return 'WalkingInvitation(id: $id, longitude: $longitude, latitude: $latitude, estimatedStartTime: $estimatedStartTime, dogs: $dogs, initiator: $initiator)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalkingInvitationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.estimatedStartTime, estimatedStartTime) ||
                other.estimatedStartTime == estimatedStartTime) &&
            const DeepCollectionEquality().equals(other._dogs, _dogs) &&
            (identical(other.initiator, initiator) ||
                other.initiator == initiator));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      longitude,
      latitude,
      estimatedStartTime,
      const DeepCollectionEquality().hash(_dogs),
      initiator);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalkingInvitationImplCopyWith<_$WalkingInvitationImpl> get copyWith =>
      __$$WalkingInvitationImplCopyWithImpl<_$WalkingInvitationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalkingInvitationImplToJson(
      this,
    );
  }
}

abstract class _WalkingInvitation implements WalkingInvitation {
  const factory _WalkingInvitation(
      {required final String id,
      required final double longitude,
      required final double latitude,
      required final DateTime estimatedStartTime,
      required final List<Dog> dogs,
      required final Owner initiator}) = _$WalkingInvitationImpl;

  factory _WalkingInvitation.fromJson(Map<String, dynamic> json) =
      _$WalkingInvitationImpl.fromJson;

  @override
  String get id;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  DateTime get estimatedStartTime;
  @override
  List<Dog> get dogs;
  @override
  Owner get initiator;
  @override
  @JsonKey(ignore: true)
  _$$WalkingInvitationImplCopyWith<_$WalkingInvitationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateWalkingInvitation _$CreateWalkingInvitationFromJson(
    Map<String, dynamic> json) {
  return _CreateWalkingInvitation.fromJson(json);
}

/// @nodoc
mixin _$CreateWalkingInvitation {
  double? get longitude => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  DateTime? get estimatedStartTime => throw _privateConstructorUsedError;
  List<Dog>? get dogs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateWalkingInvitationCopyWith<CreateWalkingInvitation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateWalkingInvitationCopyWith<$Res> {
  factory $CreateWalkingInvitationCopyWith(CreateWalkingInvitation value,
          $Res Function(CreateWalkingInvitation) then) =
      _$CreateWalkingInvitationCopyWithImpl<$Res, CreateWalkingInvitation>;
  @useResult
  $Res call(
      {double? longitude,
      double? latitude,
      DateTime? estimatedStartTime,
      List<Dog>? dogs});
}

/// @nodoc
class _$CreateWalkingInvitationCopyWithImpl<$Res,
        $Val extends CreateWalkingInvitation>
    implements $CreateWalkingInvitationCopyWith<$Res> {
  _$CreateWalkingInvitationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? estimatedStartTime = freezed,
    Object? dogs = freezed,
  }) {
    return _then(_value.copyWith(
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      estimatedStartTime: freezed == estimatedStartTime
          ? _value.estimatedStartTime
          : estimatedStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dogs: freezed == dogs
          ? _value.dogs
          : dogs // ignore: cast_nullable_to_non_nullable
              as List<Dog>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateWalkingInvitationImplCopyWith<$Res>
    implements $CreateWalkingInvitationCopyWith<$Res> {
  factory _$$CreateWalkingInvitationImplCopyWith(
          _$CreateWalkingInvitationImpl value,
          $Res Function(_$CreateWalkingInvitationImpl) then) =
      __$$CreateWalkingInvitationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? longitude,
      double? latitude,
      DateTime? estimatedStartTime,
      List<Dog>? dogs});
}

/// @nodoc
class __$$CreateWalkingInvitationImplCopyWithImpl<$Res>
    extends _$CreateWalkingInvitationCopyWithImpl<$Res,
        _$CreateWalkingInvitationImpl>
    implements _$$CreateWalkingInvitationImplCopyWith<$Res> {
  __$$CreateWalkingInvitationImplCopyWithImpl(
      _$CreateWalkingInvitationImpl _value,
      $Res Function(_$CreateWalkingInvitationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? estimatedStartTime = freezed,
    Object? dogs = freezed,
  }) {
    return _then(_$CreateWalkingInvitationImpl(
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      estimatedStartTime: freezed == estimatedStartTime
          ? _value.estimatedStartTime
          : estimatedStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dogs: freezed == dogs
          ? _value._dogs
          : dogs // ignore: cast_nullable_to_non_nullable
              as List<Dog>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateWalkingInvitationImpl implements _CreateWalkingInvitation {
  const _$CreateWalkingInvitationImpl(
      {this.longitude,
      this.latitude,
      this.estimatedStartTime,
      final List<Dog>? dogs})
      : _dogs = dogs;

  factory _$CreateWalkingInvitationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateWalkingInvitationImplFromJson(json);

  @override
  final double? longitude;
  @override
  final double? latitude;
  @override
  final DateTime? estimatedStartTime;
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
  String toString() {
    return 'CreateWalkingInvitation(longitude: $longitude, latitude: $latitude, estimatedStartTime: $estimatedStartTime, dogs: $dogs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateWalkingInvitationImpl &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.estimatedStartTime, estimatedStartTime) ||
                other.estimatedStartTime == estimatedStartTime) &&
            const DeepCollectionEquality().equals(other._dogs, _dogs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, longitude, latitude,
      estimatedStartTime, const DeepCollectionEquality().hash(_dogs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateWalkingInvitationImplCopyWith<_$CreateWalkingInvitationImpl>
      get copyWith => __$$CreateWalkingInvitationImplCopyWithImpl<
          _$CreateWalkingInvitationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateWalkingInvitationImplToJson(
      this,
    );
  }
}

abstract class _CreateWalkingInvitation implements CreateWalkingInvitation {
  const factory _CreateWalkingInvitation(
      {final double? longitude,
      final double? latitude,
      final DateTime? estimatedStartTime,
      final List<Dog>? dogs}) = _$CreateWalkingInvitationImpl;

  factory _CreateWalkingInvitation.fromJson(Map<String, dynamic> json) =
      _$CreateWalkingInvitationImpl.fromJson;

  @override
  double? get longitude;
  @override
  double? get latitude;
  @override
  DateTime? get estimatedStartTime;
  @override
  List<Dog>? get dogs;
  @override
  @JsonKey(ignore: true)
  _$$CreateWalkingInvitationImplCopyWith<_$CreateWalkingInvitationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
