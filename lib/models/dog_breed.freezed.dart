// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dog_breed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DogBreed _$DogBreedFromJson(Map<String, dynamic> json) {
  return _DogBreed.fromJson(json);
}

/// @nodoc
mixin _$DogBreed {
  String? get id => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DogBreedCopyWith<DogBreed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DogBreedCopyWith<$Res> {
  factory $DogBreedCopyWith(DogBreed value, $Res Function(DogBreed) then) =
      _$DogBreedCopyWithImpl<$Res, DogBreed>;
  @useResult
  $Res call({String? id, String? category, String? name});
}

/// @nodoc
class _$DogBreedCopyWithImpl<$Res, $Val extends DogBreed>
    implements $DogBreedCopyWith<$Res> {
  _$DogBreedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? category = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DogBreedImplCopyWith<$Res>
    implements $DogBreedCopyWith<$Res> {
  factory _$$DogBreedImplCopyWith(
          _$DogBreedImpl value, $Res Function(_$DogBreedImpl) then) =
      __$$DogBreedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? category, String? name});
}

/// @nodoc
class __$$DogBreedImplCopyWithImpl<$Res>
    extends _$DogBreedCopyWithImpl<$Res, _$DogBreedImpl>
    implements _$$DogBreedImplCopyWith<$Res> {
  __$$DogBreedImplCopyWithImpl(
      _$DogBreedImpl _value, $Res Function(_$DogBreedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? category = freezed,
    Object? name = freezed,
  }) {
    return _then(_$DogBreedImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DogBreedImpl with DiagnosticableTreeMixin implements _DogBreed {
  const _$DogBreedImpl({this.id, this.category, this.name});

  factory _$DogBreedImpl.fromJson(Map<String, dynamic> json) =>
      _$$DogBreedImplFromJson(json);

  @override
  final String? id;
  @override
  final String? category;
  @override
  final String? name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DogBreed(id: $id, category: $category, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DogBreed'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DogBreedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, category, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DogBreedImplCopyWith<_$DogBreedImpl> get copyWith =>
      __$$DogBreedImplCopyWithImpl<_$DogBreedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DogBreedImplToJson(
      this,
    );
  }
}

abstract class _DogBreed implements DogBreed {
  const factory _DogBreed(
      {final String? id,
      final String? category,
      final String? name}) = _$DogBreedImpl;

  factory _DogBreed.fromJson(Map<String, dynamic> json) =
      _$DogBreedImpl.fromJson;

  @override
  String? get id;
  @override
  String? get category;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$DogBreedImplCopyWith<_$DogBreedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
