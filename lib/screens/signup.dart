import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/auth.dart';
import 'package:little_walk/apis/common.dart';
import 'package:little_walk/apis/http_client.dart';
import 'package:little_walk/blocs/auth.dart';
import 'package:little_walk/components/send_verification_code_button.dart';
import 'package:little_walk/models/auth.dart';
import 'package:little_walk/screens/home.dart';
import 'package:little_walk/screens/login.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController ctrl = TextEditingController();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => AuthCubit(client: HttpClient.fromEnv()),
        child: Builder(builder: (context) {
          final auth = BlocProvider.of<AuthCubit>(context);
          return Scaffold(
            body: Center(
              child: Column(children: [
                Padding(
                    padding:
                        const EdgeInsets.only(top: 100.0, left: 30, right: 30),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextField(
                            onChanged: (value) {},
                            decoration:
                                const InputDecoration(hintText: "请输入手机号"),
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 30, right: 30),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          onChanged: (value) => auth.setPassword(value),
                          decoration: InputDecoration(
                              hintText: "请输入密码",
                              errorText: auth.state.result.password == "" ||
                                      auth.state.result.password == ctrl.text
                                  ? null
                                  : "密码不一致"),
                        ))
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                  child: Row(children: [
                    Expanded(
                        child: TextField(
                      controller: ctrl,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(hintText: "再次输入密码"),
                    ))
                  ]),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: auth.state.result.password == ctrl.text
                                ? () {
                                    auth.signup().then((token) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    });
                                  }
                                : null,
                            child: const Text("注册"))
                      ],
                    ))
              ]),
            ),
          );
        }));
  }
}
