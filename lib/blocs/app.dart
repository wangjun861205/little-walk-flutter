import 'package:flutter_bloc/flutter_bloc.dart';

class App {
  String backendAddress;
  String? authToken;

  App(this.backendAddress, this.authToken);
}

class AppCubit extends Cubit<App> {
  AppCubit({required String backendAddress, String? authToken})
      : super(App(backendAddress, authToken));

  void setAuthToken(String? authToken) {
    state.authToken = authToken;
    emit(state);
  }
}

class ScreenIndexCubit extends Cubit<int> {
  ScreenIndexCubit() : super(0);

  void setIndex(int i) => emit(i);
}
