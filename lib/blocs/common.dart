import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'common.freezed.dart';

@freezed
class Query<P, T> with _$Query<P, T> {
  const factory Query({
    required Future<T> Function(P params) query,
    required P params,
    required T result,
    P Function(P currParams, T response)? nextParams,
    T Function(T currResult, T response)? nextResult,
    @Default(false) bool isLoading,
    Object? error,
  }) = _Query;
}

class QueryCubit<P, T> extends Cubit<Query<P, T>> {
  QueryCubit(Query<P, T> query) : super(query);

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    emit(state.copyWith(isLoading: false, error: error));
  }

  void query() {
    emit(state.copyWith(isLoading: true, error: null));
    state.query(state.params).then((res) {
      final result =
          state.nextResult != null ? state.nextResult!(state.result, res) : res;
      final params = state.nextParams != null
          ? state.nextParams!(state.params, res)
          : state.params;
      emit(state.copyWith(
          isLoading: false, error: null, result: result, params: params));
    }, onError: (err) {
      emit(state.copyWith(isLoading: false, error: err));
    });
  }
}
