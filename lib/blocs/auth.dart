import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/models/auth.dart';

class SignupCubit extends Cubit<Signup> {
  SignupCubit(Signup signup) : super(signup);

  void setPhone(String phone) {
    state.phone = phone;
    emit(state);
  }

  void setPassword(String password) {
    state.password = password;
    emit(state);
  }

  void setPasswordRepeat(String passwordRepeat) {
    state.passwordRepeat = passwordRepeat;
    emit(state);
  }

  void setVerificationCode(String verificationCode) {
    state.verificationCode = verificationCode;
    emit(state);
  }
}
