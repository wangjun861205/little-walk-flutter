import "package:freezed_annotation/freezed_annotation.dart";
part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
class Signup with _$Signup {
  const factory Signup({
    required String phone,
    required String password,
  }) = _Signup;
}

@freezed
class Login with _$Login {
  const factory Login({
    required String phone,
    required String password,
  }) = _Login;
}

@freezed
class User with _$User {
  const factory User({required String id, required String phone}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
