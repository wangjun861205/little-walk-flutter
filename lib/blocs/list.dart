import 'package:flutter_bloc/flutter_bloc.dart';

class ListCubit<T> extends Cubit<List<T>> {
  ListCubit(List<T> list) : super(list);

  void append(Iterable<T> items) {
    state.addAll(items);
    emit(state);
  }
}
