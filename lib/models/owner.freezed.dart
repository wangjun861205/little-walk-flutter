// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'owner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Owner _$OwnerFromJson(Map<String, dynamic> json) {
  return _Owner.fromJson(json);
}

/// @nodoc
mixin _$Owner {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  List<Dog>? get dogs => throw _privateConstructorUsedError;
  List<Owner>? get friends => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OwnerCopyWith<Owner> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnerCopyWith<$Res> {
  factory $OwnerCopyWith(Owner value, $Res Function(Owner) then) =
      _$OwnerCopyWithImpl<$Res, Owner>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? avatar,
      User? user,
      List<Dog>? dogs,
      List<Owner>? friends});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$OwnerCopyWithImpl<$Res, $Val extends Owner>
    implements $OwnerCopyWith<$Res> {
  _$OwnerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? user = freezed,
    Object? dogs = freezed,
    Object? friends = freezed,
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
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      dogs: freezed == dogs
          ? _value.dogs
          : dogs // ignore: cast_nullable_to_non_nullable
              as List<Dog>?,
      friends: freezed == friends
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<Owner>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OwnerImplCopyWith<$Res> implements $OwnerCopyWith<$Res> {
  factory _$$OwnerImplCopyWith(
          _$OwnerImpl value, $Res Function(_$OwnerImpl) then) =
      __$$OwnerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? avatar,
      User? user,
      List<Dog>? dogs,
      List<Owner>? friends});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$OwnerImplCopyWithImpl<$Res>
    extends _$OwnerCopyWithImpl<$Res, _$OwnerImpl>
    implements _$$OwnerImplCopyWith<$Res> {
  __$$OwnerImplCopyWithImpl(
      _$OwnerImpl _value, $Res Function(_$OwnerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? user = freezed,
    Object? dogs = freezed,
    Object? friends = freezed,
  }) {
    return _then(_$OwnerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      dogs: freezed == dogs
          ? _value._dogs
          : dogs // ignore: cast_nullable_to_non_nullable
              as List<Dog>?,
      friends: freezed == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<Owner>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OwnerImpl implements _Owner {
  const _$OwnerImpl(
      {this.id,
      this.name,
      this.avatar,
      this.user,
      final List<Dog>? dogs,
      final List<Owner>? friends})
      : _dogs = dogs,
        _friends = friends;

  factory _$OwnerImpl.fromJson(Map<String, dynamic> json) =>
      _$$OwnerImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? avatar;
  @override
  final User? user;
  final List<Dog>? _dogs;
  @override
  List<Dog>? get dogs {
    final value = _dogs;
    if (value == null) return null;
    if (_dogs is EqualUnmodifiableListView) return _dogs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Owner>? _friends;
  @override
  List<Owner>? get friends {
    final value = _friends;
    if (value == null) return null;
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Owner(id: $id, name: $name, avatar: $avatar, user: $user, dogs: $dogs, friends: $friends)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OwnerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._dogs, _dogs) &&
            const DeepCollectionEquality().equals(other._friends, _friends));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      avatar,
      user,
      const DeepCollectionEquality().hash(_dogs),
      const DeepCollectionEquality().hash(_friends));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OwnerImplCopyWith<_$OwnerImpl> get copyWith =>
      __$$OwnerImplCopyWithImpl<_$OwnerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OwnerImplToJson(
      this,
    );
  }
}

abstract class _Owner implements Owner {
  const factory _Owner(
      {final String? id,
      final String? name,
      final String? avatar,
      final User? user,
      final List<Dog>? dogs,
      final List<Owner>? friends}) = _$OwnerImpl;

  factory _Owner.fromJson(Map<String, dynamic> json) = _$OwnerImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get avatar;
  @override
  User? get user;
  @override
  List<Dog>? get dogs;
  @override
  List<Owner>? get friends;
  @override
  @JsonKey(ignore: true)
  _$$OwnerImplCopyWith<_$OwnerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Ownership _$OwnershipFromJson(Map<String, dynamic> json) {
  return _Ownership.fromJson(json);
}

/// @nodoc
mixin _$Ownership {
  Owner get owner => throw _privateConstructorUsedError;
  Dog get dog => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OwnershipCopyWith<Ownership> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnershipCopyWith<$Res> {
  factory $OwnershipCopyWith(Ownership value, $Res Function(Ownership) then) =
      _$OwnershipCopyWithImpl<$Res, Ownership>;
  @useResult
  $Res call({Owner owner, Dog dog, bool isValid});

  $OwnerCopyWith<$Res> get owner;
  $DogCopyWith<$Res> get dog;
}

/// @nodoc
class _$OwnershipCopyWithImpl<$Res, $Val extends Ownership>
    implements $OwnershipCopyWith<$Res> {
  _$OwnershipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? owner = null,
    Object? dog = null,
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner,
      dog: null == dog
          ? _value.dog
          : dog // ignore: cast_nullable_to_non_nullable
              as Dog,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OwnerCopyWith<$Res> get owner {
    return $OwnerCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DogCopyWith<$Res> get dog {
    return $DogCopyWith<$Res>(_value.dog, (value) {
      return _then(_value.copyWith(dog: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OwnershipImplCopyWith<$Res>
    implements $OwnershipCopyWith<$Res> {
  factory _$$OwnershipImplCopyWith(
          _$OwnershipImpl value, $Res Function(_$OwnershipImpl) then) =
      __$$OwnershipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Owner owner, Dog dog, bool isValid});

  @override
  $OwnerCopyWith<$Res> get owner;
  @override
  $DogCopyWith<$Res> get dog;
}

/// @nodoc
class __$$OwnershipImplCopyWithImpl<$Res>
    extends _$OwnershipCopyWithImpl<$Res, _$OwnershipImpl>
    implements _$$OwnershipImplCopyWith<$Res> {
  __$$OwnershipImplCopyWithImpl(
      _$OwnershipImpl _value, $Res Function(_$OwnershipImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? owner = null,
    Object? dog = null,
    Object? isValid = null,
  }) {
    return _then(_$OwnershipImpl(
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner,
      dog: null == dog
          ? _value.dog
          : dog // ignore: cast_nullable_to_non_nullable
              as Dog,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OwnershipImpl implements _Ownership {
  const _$OwnershipImpl(
      {required this.owner, required this.dog, required this.isValid});

  factory _$OwnershipImpl.fromJson(Map<String, dynamic> json) =>
      _$$OwnershipImplFromJson(json);

  @override
  final Owner owner;
  @override
  final Dog dog;
  @override
  final bool isValid;

  @override
  String toString() {
    return 'Ownership(owner: $owner, dog: $dog, isValid: $isValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OwnershipImpl &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.dog, dog) || other.dog == dog) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, owner, dog, isValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OwnershipImplCopyWith<_$OwnershipImpl> get copyWith =>
      __$$OwnershipImplCopyWithImpl<_$OwnershipImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OwnershipImplToJson(
      this,
    );
  }
}

abstract class _Ownership implements Ownership {
  const factory _Ownership(
      {required final Owner owner,
      required final Dog dog,
      required final bool isValid}) = _$OwnershipImpl;

  factory _Ownership.fromJson(Map<String, dynamic> json) =
      _$OwnershipImpl.fromJson;

  @override
  Owner get owner;
  @override
  Dog get dog;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$OwnershipImplCopyWith<_$OwnershipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
