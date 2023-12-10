// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dog.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Dog _$DogFromJson(Map<String, dynamic> json) {
  return _Dog.fromJson(json);
}

/// @nodoc
mixin _$Dog {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  DogBreed get breed => throw _privateConstructorUsedError;
  @JsonKey(name: "portrait_id")
  String? get portraitID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DogCopyWith<Dog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DogCopyWith<$Res> {
  factory $DogCopyWith(Dog value, $Res Function(Dog) then) =
      _$DogCopyWithImpl<$Res, Dog>;
  @useResult
  $Res call(
      {String id,
      String name,
      String gender,
      DogBreed breed,
      @JsonKey(name: "portrait_id") String? portraitID});

  $DogBreedCopyWith<$Res> get breed;
}

/// @nodoc
class _$DogCopyWithImpl<$Res, $Val extends Dog> implements $DogCopyWith<$Res> {
  _$DogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? gender = null,
    Object? breed = null,
    Object? portraitID = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as DogBreed,
      portraitID: freezed == portraitID
          ? _value.portraitID
          : portraitID // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DogBreedCopyWith<$Res> get breed {
    return $DogBreedCopyWith<$Res>(_value.breed, (value) {
      return _then(_value.copyWith(breed: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DogImplCopyWith<$Res> implements $DogCopyWith<$Res> {
  factory _$$DogImplCopyWith(_$DogImpl value, $Res Function(_$DogImpl) then) =
      __$$DogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String gender,
      DogBreed breed,
      @JsonKey(name: "portrait_id") String? portraitID});

  @override
  $DogBreedCopyWith<$Res> get breed;
}

/// @nodoc
class __$$DogImplCopyWithImpl<$Res> extends _$DogCopyWithImpl<$Res, _$DogImpl>
    implements _$$DogImplCopyWith<$Res> {
  __$$DogImplCopyWithImpl(_$DogImpl _value, $Res Function(_$DogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? gender = null,
    Object? breed = null,
    Object? portraitID = freezed,
  }) {
    return _then(_$DogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as DogBreed,
      portraitID: freezed == portraitID
          ? _value.portraitID
          : portraitID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DogImpl with DiagnosticableTreeMixin implements _Dog {
  const _$DogImpl(
      {required this.id,
      required this.name,
      required this.gender,
      required this.breed,
      @JsonKey(name: "portrait_id") this.portraitID});

  factory _$DogImpl.fromJson(Map<String, dynamic> json) =>
      _$$DogImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String gender;
  @override
  final DogBreed breed;
  @override
  @JsonKey(name: "portrait_id")
  final String? portraitID;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Dog(id: $id, name: $name, gender: $gender, breed: $breed, portraitID: $portraitID)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Dog'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('breed', breed))
      ..add(DiagnosticsProperty('portraitID', portraitID));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.portraitID, portraitID) ||
                other.portraitID == portraitID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, gender, breed, portraitID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DogImplCopyWith<_$DogImpl> get copyWith =>
      __$$DogImplCopyWithImpl<_$DogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DogImplToJson(
      this,
    );
  }
}

abstract class _Dog implements Dog {
  const factory _Dog(
      {required final String id,
      required final String name,
      required final String gender,
      required final DogBreed breed,
      @JsonKey(name: "portrait_id") final String? portraitID}) = _$DogImpl;

  factory _Dog.fromJson(Map<String, dynamic> json) = _$DogImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get gender;
  @override
  DogBreed get breed;
  @override
  @JsonKey(name: "portrait_id")
  String? get portraitID;
  @override
  @JsonKey(ignore: true)
  _$$DogImplCopyWith<_$DogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DogValue {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: "breed_id")
  String? get breedID => throw _privateConstructorUsedError;
  @JsonKey(name: "portrait_id")
  String? get portraitID => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DogValueCopyWith<DogValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DogValueCopyWith<$Res> {
  factory $DogValueCopyWith(DogValue value, $Res Function(DogValue) then) =
      _$DogValueCopyWithImpl<$Res, DogValue>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? gender,
      @JsonKey(name: "breed_id") String? breedID,
      @JsonKey(name: "portrait_id") String? portraitID});
}

/// @nodoc
class _$DogValueCopyWithImpl<$Res, $Val extends DogValue>
    implements $DogValueCopyWith<$Res> {
  _$DogValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? gender = freezed,
    Object? breedID = freezed,
    Object? portraitID = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      breedID: freezed == breedID
          ? _value.breedID
          : breedID // ignore: cast_nullable_to_non_nullable
              as String?,
      portraitID: freezed == portraitID
          ? _value.portraitID
          : portraitID // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DogValueImplCopyWith<$Res>
    implements $DogValueCopyWith<$Res> {
  factory _$$DogValueImplCopyWith(
          _$DogValueImpl value, $Res Function(_$DogValueImpl) then) =
      __$$DogValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? gender,
      @JsonKey(name: "breed_id") String? breedID,
      @JsonKey(name: "portrait_id") String? portraitID});
}

/// @nodoc
class __$$DogValueImplCopyWithImpl<$Res>
    extends _$DogValueCopyWithImpl<$Res, _$DogValueImpl>
    implements _$$DogValueImplCopyWith<$Res> {
  __$$DogValueImplCopyWithImpl(
      _$DogValueImpl _value, $Res Function(_$DogValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? gender = freezed,
    Object? breedID = freezed,
    Object? portraitID = freezed,
  }) {
    return _then(_$DogValueImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      breedID: freezed == breedID
          ? _value.breedID
          : breedID // ignore: cast_nullable_to_non_nullable
              as String?,
      portraitID: freezed == portraitID
          ? _value.portraitID
          : portraitID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DogValueImpl with DiagnosticableTreeMixin implements _DogValue {
  const _$DogValueImpl(
      {this.id,
      this.name,
      this.gender,
      @JsonKey(name: "breed_id") this.breedID,
      @JsonKey(name: "portrait_id") this.portraitID});

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? gender;
  @override
  @JsonKey(name: "breed_id")
  final String? breedID;
  @override
  @JsonKey(name: "portrait_id")
  final String? portraitID;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DogValue(id: $id, name: $name, gender: $gender, breedID: $breedID, portraitID: $portraitID)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DogValue'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('breedID', breedID))
      ..add(DiagnosticsProperty('portraitID', portraitID));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DogValueImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.breedID, breedID) || other.breedID == breedID) &&
            (identical(other.portraitID, portraitID) ||
                other.portraitID == portraitID));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, gender, breedID, portraitID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DogValueImplCopyWith<_$DogValueImpl> get copyWith =>
      __$$DogValueImplCopyWithImpl<_$DogValueImpl>(this, _$identity);
}

abstract class _DogValue implements DogValue {
  const factory _DogValue(
      {final String? id,
      final String? name,
      final String? gender,
      @JsonKey(name: "breed_id") final String? breedID,
      @JsonKey(name: "portrait_id") final String? portraitID}) = _$DogValueImpl;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get gender;
  @override
  @JsonKey(name: "breed_id")
  String? get breedID;
  @override
  @JsonKey(name: "portrait_id")
  String? get portraitID;
  @override
  @JsonKey(ignore: true)
  _$$DogValueImplCopyWith<_$DogValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
