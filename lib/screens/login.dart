import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/app.dart';
import 'package:little_walk/components/send_verification_code_button.dart';
import 'package:little_walk/components/verification_code_login_button.dart';
import 'package:little_walk/screens/signup.dart';

class _LoginScreenState extends State<LoginScreen> {
  String phone = "";
  String code = "";

  @override
  Widget build(BuildContext context) {
    final appBloc = BlocProvider.of<AppCubit>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("登录"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 20.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      onChanged: (value) => setState(() {
                        phone = value;
                      }),
                      decoration: const InputDecoration(hintText: "请输入手机号"),
                    ),
                  ),
                  Expanded(
                      child: SendVerificationCodeButton(
                          phone, widget.verificationCodeInterval))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: const InputDecoration(hintText: "请输入验证码"),
                onChanged: (value) => setState(() {
                  code = value;
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: VerificationCodeLoginButton(
                  ValueNotifier(phone), ValueNotifier(code)),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextButton(
                    child: const Text("去注册"),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignupScreen()));
                    }))
          ],
        )));
  }
}

class LoginScreen extends StatefulWidget {
  final int verificationCodeInterval;
  const LoginScreen(this.verificationCodeInterval, {super.key});
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}
