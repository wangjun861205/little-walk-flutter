import 'package:flutter_bloc/flutter_bloc.dart';

class Pagination {
  int page;
  int size;

  Pagination({required this.page, required this.size});
}

class PaginationCubit extends Cubit<Pagination> {
  PaginationCubit(Pagination pagination) : super(pagination);

  void setPage(int page) {
    state.page = page;
    emit(state);
  }

  void setSize(int size) {
    state.size = size;
    emit(state);
  }
}
