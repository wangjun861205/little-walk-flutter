import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/walk_request.dart';
import 'package:little_walk/blocs/common.dart';
import 'package:little_walk/models/dog.dart';
import 'package:little_walk/models/walk_request.dart';

class WalkRequestCubit extends QueryCubit<String, WalkRequest?> {
  WalkRequestCubit(String id)
      : super(Query(
          query: ({required String params}) async => getWalkRequest(id),
          params: id,
          result: null,
        ));

  void set(WalkRequest req) => emit(state.copyWith(result: req));

  void accept() {
    emit(state.copyWith(isLoading: true, error: null));
    acceptWalkRequest(state.result!.id).then(
        (res) =>
            emit(state.copyWith(isLoading: false, error: null, result: res)),
        onError: (err) => emit(state.copyWith(isLoading: false, error: err)));
  }

  void cancel() {
    emit(state.copyWith(isLoading: true, error: null));
    cancelWalkRequest(state.result!.id).then(
        (res) =>
            emit(state.copyWith(isLoading: false, error: null, result: res)),
        onError: (err) => emit(state.copyWith(isLoading: false, error: err)));
  }
}

class MyWalkRequestsParams with QueryListParams {
  MyWalkRequestsParams({int limit = 20, String? after}) {
    limit = limit;
    after = after;
  }
}

class MyWalkRequestsCubit
    extends QueryCubit<MyWalkRequestsParams, List<WalkRequest>> {
  MyWalkRequestsCubit({int limit = 20})
      : super(Query(
            query: ({required MyWalkRequestsParams params}) async =>
                myWalkRequests(limit: params.limit, after: params.after),
            params: MyWalkRequestsParams(limit: limit),
            result: [],
            nextParams: (
                {required MyWalkRequestsParams currParams,
                required List<WalkRequest> response}) {
              if (response.isEmpty) {
                return currParams;
              }
              return MyWalkRequestsParams(
                  limit: currParams.limit, after: response.last.id);
            },
            nextResult: (
                {required List<WalkRequest> currResult,
                required List<WalkRequest> response}) {
              currResult.addAll(response);
              return currResult;
            }));
}
