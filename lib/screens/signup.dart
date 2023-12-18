import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/auth.dart';
import 'package:little_walk/apis/common.dart';
import 'package:little_walk/blocs/auth.dart';
import 'package:little_walk/components/send_verification_code_button.dart';
import 'package:little_walk/models/auth.dart';
import 'package:little_walk/screens/home.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SignupCubit(Signup.empty()),
        child: BlocBuilder<SignupCubit, Signup>(builder: (context, _) {
          final bloc = BlocProvider.of<SignupCubit>(context);
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
                        Expanded(
                          child:
                              SendVerificationCodeButton(bloc.state.phone, 60),
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                  child: Row(children: [
                    Expanded(
                        child: TextField(
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(hintText: "请输入验证码"),
                      onChanged: (value) {
                        bloc.setVerificationCode(value);
                      },
                    ))
                  ]),
                ),
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
                          onChanged: (value) => bloc.setPassword(value),
                          decoration: InputDecoration(
                              hintText: "请输入密码",
                              errorText: bloc.state.password == "" ||
                                      bloc.state.password ==
                                          bloc.state.passwordRepeat
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
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(hintText: "再次输入密码"),
                      onChanged: (value) => bloc.setPasswordRepeat(value),
                    ))
                  ]),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: bloc.state.password ==
                                    bloc.state.passwordRepeat
                                ? () {
                                    signup(
                                            bloc.state.phone,
                                            bloc.state.password,
                                            bloc.state.verificationCode)
                                        .then((token) {
                                      putAuthToken(token);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeScreen()));
                                    }).catchError((e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                              SnackBar(content: Text("$e")));
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
