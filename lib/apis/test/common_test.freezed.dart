// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Params _$ParamsFromJson(Map<String, dynamic> json) {
  return _Params.fromJson(json);
}

/// @nodoc
mixin _$Params {
  String get name => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  Pagination get pagination => throw _privateConstructorUsedError;
  List<String> get ids => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParamsCopyWith<Params> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParamsCopyWith<$Res> {
  factory $ParamsCopyWith(Params value, $Res Function(Params) then) =
      _$ParamsCopyWithImpl<$Res, Params>;
  @useResult
  $Res call({String name, int age, Pagination pagination, List<String> ids});

  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$ParamsCopyWithImpl<$Res, $Val extends Params>
    implements $ParamsCopyWith<$Res> {
  _$ParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? age = null,
    Object? pagination = null,
    Object? ids = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
      ids: null == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<$Res> get pagination {
    return $PaginationCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ParamsImplCopyWith<$Res> implements $ParamsCopyWith<$Res> {
  factory _$$ParamsImplCopyWith(
          _$ParamsImpl value, $Res Function(_$ParamsImpl) then) =
      __$$ParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int age, Pagination pagination, List<String> ids});

  @override
  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$ParamsImplCopyWithImpl<$Res>
    extends _$ParamsCopyWithImpl<$Res, _$ParamsImpl>
    implements _$$ParamsImplCopyWith<$Res> {
  __$$ParamsImplCopyWithImpl(
      _$ParamsImpl _value, $Res Function(_$ParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? age = null,
    Object? pagination = null,
    Object? ids = null,
  }) {
    return _then(_$ParamsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
      ids: null == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParamsImpl with DiagnosticableTreeMixin implements _Params {
  const _$ParamsImpl(
      {required this.name,
      required this.age,
      required this.pagination,
      required final List<String> ids})
      : _ids = ids;

  factory _$ParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParamsImplFromJson(json);

  @override
  final String name;
  @override
  final int age;
  @override
  final Pagination pagination;
  final List<String> _ids;
  @override
  List<String> get ids {
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ids);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Params(name: $name, age: $age, pagination: $pagination, ids: $ids)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Params'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('age', age))
      ..add(DiagnosticsProperty('pagination', pagination))
      ..add(DiagnosticsProperty('ids', ids));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParamsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            const DeepCollectionEquality().equals(other._ids, _ids));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, age, pagination,
      const DeepCollectionEquality().hash(_ids));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParamsImplCopyWith<_$ParamsImpl> get copyWith =>
      __$$ParamsImplCopyWithImpl<_$ParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParamsImplToJson(
      this,
    );
  }
}

abstract class _Params implements Params {
  const factory _Params(
      {required final String name,
      required final int age,
      required final Pagination pagination,
      required final List<String> ids}) = _$ParamsImpl;

  factory _Params.fromJson(Map<String, dynamic> json) = _$ParamsImpl.fromJson;

  @override
  String get name;
  @override
  int get age;
  @override
  Pagination get pagination;
  @override
  List<String> get ids;
  @override
  @JsonKey(ignore: true)
  _$$ParamsImplCopyWith<_$ParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
