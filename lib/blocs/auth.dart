import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:little_walk/apis/client.dart';
import 'package:little_walk/blocs/common.dart';
import 'package:little_walk/main.dart';
import 'package:little_walk/models/auth.dart';

class AuthCubit extends QueryCubit<void, Auth> {
  AuthClient client;

  AuthCubit({required this.client})
      : super(Query(
            query: (_) async => const Auth(),
            params: null,
            result: const Auth()));

  Future<void> signup() async {
    emit(state.copyWith(isLoading: true, error: null));
    await client.signup(state.result);
    emit(state.copyWith(isLoading: false));
  }

  Future<void> login() async {
    emit(state.copyWith(isLoading: true, error: null));
    final token = await client.login(state.result);
    await const FlutterSecureStorage().write(key: "AUTH_TOKEN", value: token);
    AuthToken.token = token;
    emit(state.copyWith(isLoading: false));
  }

  void setPhone(String phone) =>
      emit(state.copyWith(result: state.result.copyWith(phone: phone)));

  void setPassword(String password) =>
      emit(state.copyWith(result: state.result.copyWith(password: password)));
}
