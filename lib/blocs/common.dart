import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'common.freezed.dart';
part 'common.g.dart';

mixin class QueryListParams {
  int limit = 20;
  String? after;
}

@freezed
class Query<P, T> with _$Query<P, T> {
  const factory Query({
    required Future<T> Function({required P params}) query,
    required P params,
    required T result,
    P Function({required P currParams, required T response})? nextParams,
    T Function({required T currResult, required T response})? nextResult,
    @Default(false) bool isLoading,
    Object? error,
  }) = _Query;
}

class QueryCubit<P, T> extends Cubit<Query<P, T>> {
  QueryCubit(Query<P, T> query) : super(query);

  void next() {
    emit(state.copyWith(isLoading: true, error: null));
    state.query(params: state.params).then((res) {
      final result = state.nextResult != null
          ? state.nextResult!(currResult: state.result, response: res)
          : res;
      final params = state.nextParams != null
          ? state.nextParams!(currParams: state.params, response: res)
          : state.params;
      emit(state.copyWith(
          isLoading: false, error: null, result: result, params: params));
    }, onError: (err) {
      emit(state.copyWith(isLoading: false, error: err));
    });
  }
}
