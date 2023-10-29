import 'package:flutter/material.dart';
import 'package:little_walk/apis/auth.dart';
import 'package:little_walk/apis/common.dart';

class VerificationCodeLoginButton extends StatelessWidget {
  final ValueNotifier<String> phone;
  final ValueNotifier<String> code;

  const VerificationCodeLoginButton(this.phone, this.code, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          loginByVerificationCode(phone.value, code.value).then((token) {
            putAuthToken(token);
          }).catchError((err) {
            debugPrint(err.toString());
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("登录失败")));
          });
        },
        child: const Text("登录"));
  }
}
