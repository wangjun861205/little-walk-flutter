import 'package:flutter_bloc/flutter_bloc.dart';

enum LoadStatus {
  loading,
  loaded,
  error,
}

class LoadResult<T> {
  LoadStatus status;
  T? data;
  Object? error;
  LoadResult({required this.status, this.data, this.error});
}

class LoadResultCubit<T> extends Cubit<LoadResult<T>> {
  LoadResultCubit(LoadResult<T> res) : super(res);

  void set(LoadResult<T> res) => emit(res);
  void setData(T? data) =>
      emit(LoadResult(status: LoadStatus.loaded, data: data, error: null));
  void setError(Object? error) =>
      emit(LoadResult(status: LoadStatus.error, data: null, error: error));
}

typedef FutureFactory<T, A> = Future<T?> Function(T? ori, A arg);

class FutureState<T, A> {
  LoadResult<T> result;
  A arg;

  FutureState({required this.result, required this.arg});
}

class FutureCubit<T, A> extends Cubit<FutureState> {
  FutureFactory<T, A> factory;
  FutureCubit({required this.factory, required T initData, required A arg})
      : super(FutureState(
            result: LoadResult(status: LoadStatus.loading, data: initData),
            arg: arg)) {
    factory(initData, arg).then((data) {
      emit(FutureState(
          result:
              LoadResult(status: LoadStatus.loaded, data: data, error: null),
          arg: arg));
    },
        onError: (err) => emit(FutureState(
            result: LoadResult(
                status: LoadStatus.error, data: state.result.data, error: err),
            arg: arg)));
  }

  void setArg(A arg) {
    emit(FutureState(
        result: LoadResult(
            status: LoadStatus.loading, data: state.result.data, error: null),
        arg: arg));
    factory(state.result.data, arg).then(
        (data) => emit(FutureState(
            result:
                LoadResult(status: LoadStatus.loaded, data: data, error: null),
            arg: arg)),
        onError: (err) => emit(FutureState(
            result: LoadResult(
                status: LoadStatus.error, data: state.result.data, error: err),
            arg: arg)));
  }

  void refresh() {
    emit(FutureState(
      result: LoadResult(
        status: LoadStatus.loading,
        data: state.result.data,
        error: null,
      ),
      arg: state.arg,
    ));
    factory(state.result.data, state.arg).then(
        (data) => emit(FutureState(
            result:
                LoadResult(status: LoadStatus.loaded, data: data, error: null),
            arg: state.arg)),
        onError: (err) => emit(FutureState(
            result: LoadResult(
                status: LoadStatus.error, data: state.result.data, error: err),
            arg: state.arg)));
  }
}
