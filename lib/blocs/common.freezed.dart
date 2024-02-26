// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Query<P, T> {
  Future<T> Function({required P params}) get query =>
      throw _privateConstructorUsedError;
  P get params => throw _privateConstructorUsedError;
  T get result => throw _privateConstructorUsedError;
  P Function({required P currParams, required T response})? get nextParams =>
      throw _privateConstructorUsedError;
  T Function({required T currResult, required T response})? get nextResult =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QueryCopyWith<P, T, Query<P, T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryCopyWith<P, T, $Res> {
  factory $QueryCopyWith(Query<P, T> value, $Res Function(Query<P, T>) then) =
      _$QueryCopyWithImpl<P, T, $Res, Query<P, T>>;
  @useResult
  $Res call(
      {Future<T> Function({required P params}) query,
      P params,
      T result,
      P Function({required P currParams, required T response})? nextParams,
      T Function({required T currResult, required T response})? nextResult,
      bool isLoading,
      Object? error});
}

/// @nodoc
class _$QueryCopyWithImpl<P, T, $Res, $Val extends Query<P, T>>
    implements $QueryCopyWith<P, T, $Res> {
  _$QueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? params = freezed,
    Object? result = freezed,
    Object? nextParams = freezed,
    Object? nextResult = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as Future<T> Function({required P params}),
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as P,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as T,
      nextParams: freezed == nextParams
          ? _value.nextParams
          : nextParams // ignore: cast_nullable_to_non_nullable
              as P Function({required P currParams, required T response})?,
      nextResult: freezed == nextResult
          ? _value.nextResult
          : nextResult // ignore: cast_nullable_to_non_nullable
              as T Function({required T currResult, required T response})?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QueryImplCopyWith<P, T, $Res>
    implements $QueryCopyWith<P, T, $Res> {
  factory _$$QueryImplCopyWith(
          _$QueryImpl<P, T> value, $Res Function(_$QueryImpl<P, T>) then) =
      __$$QueryImplCopyWithImpl<P, T, $Res>;
  @override
  @useResult
  $Res call(
      {Future<T> Function({required P params}) query,
      P params,
      T result,
      P Function({required P currParams, required T response})? nextParams,
      T Function({required T currResult, required T response})? nextResult,
      bool isLoading,
      Object? error});
}

/// @nodoc
class __$$QueryImplCopyWithImpl<P, T, $Res>
    extends _$QueryCopyWithImpl<P, T, $Res, _$QueryImpl<P, T>>
    implements _$$QueryImplCopyWith<P, T, $Res> {
  __$$QueryImplCopyWithImpl(
      _$QueryImpl<P, T> _value, $Res Function(_$QueryImpl<P, T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? params = freezed,
    Object? result = freezed,
    Object? nextParams = freezed,
    Object? nextResult = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$QueryImpl<P, T>(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as Future<T> Function({required P params}),
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as P,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as T,
      nextParams: freezed == nextParams
          ? _value.nextParams
          : nextParams // ignore: cast_nullable_to_non_nullable
              as P Function({required P currParams, required T response})?,
      nextResult: freezed == nextResult
          ? _value.nextResult
          : nextResult // ignore: cast_nullable_to_non_nullable
              as T Function({required T currResult, required T response})?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$QueryImpl<P, T> with DiagnosticableTreeMixin implements _Query<P, T> {
  const _$QueryImpl(
      {required this.query,
      required this.params,
      required this.result,
      this.nextParams,
      this.nextResult,
      this.isLoading = false,
      this.error});

  @override
  final Future<T> Function({required P params}) query;
  @override
  final P params;
  @override
  final T result;
  @override
  final P Function({required P currParams, required T response})? nextParams;
  @override
  final T Function({required T currResult, required T response})? nextResult;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final Object? error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Query<$P, $T>(query: $query, params: $params, result: $result, nextParams: $nextParams, nextResult: $nextResult, isLoading: $isLoading, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Query<$P, $T>'))
      ..add(DiagnosticsProperty('query', query))
      ..add(DiagnosticsProperty('params', params))
      ..add(DiagnosticsProperty('result', result))
      ..add(DiagnosticsProperty('nextParams', nextParams))
      ..add(DiagnosticsProperty('nextResult', nextResult))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryImpl<P, T> &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality().equals(other.params, params) &&
            const DeepCollectionEquality().equals(other.result, result) &&
            (identical(other.nextParams, nextParams) ||
                other.nextParams == nextParams) &&
            (identical(other.nextResult, nextResult) ||
                other.nextResult == nextResult) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      query,
      const DeepCollectionEquality().hash(params),
      const DeepCollectionEquality().hash(result),
      nextParams,
      nextResult,
      isLoading,
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryImplCopyWith<P, T, _$QueryImpl<P, T>> get copyWith =>
      __$$QueryImplCopyWithImpl<P, T, _$QueryImpl<P, T>>(this, _$identity);
}

abstract class _Query<P, T> implements Query<P, T> {
  const factory _Query(
      {required final Future<T> Function({required P params}) query,
      required final P params,
      required final T result,
      final P Function({required P currParams, required T response})?
          nextParams,
      final T Function({required T currResult, required T response})?
          nextResult,
      final bool isLoading,
      final Object? error}) = _$QueryImpl<P, T>;

  @override
  Future<T> Function({required P params}) get query;
  @override
  P get params;
  @override
  T get result;
  @override
  P Function({required P currParams, required T response})? get nextParams;
  @override
  T Function({required T currResult, required T response})? get nextResult;
  @override
  bool get isLoading;
  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$QueryImplCopyWith<P, T, _$QueryImpl<P, T>> get copyWith =>
      throw _privateConstructorUsedError;
}
