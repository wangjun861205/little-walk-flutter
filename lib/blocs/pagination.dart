import 'package:flutter_bloc/flutter_bloc.dart';

class Pagination {
  int page;
  int size;

  Pagination({
    required this.page,
    required this.size,
  });
}

class PaginationCubit extends Cubit<Pagination> {
  PaginationCubit(Pagination pagination) : super(pagination);

  void setPage(int page) {
    emit(Pagination(page: page, size: state.size));
  }

  void setSize(int size) {
    emit(Pagination(page: state.page, size: size));
  }
}
