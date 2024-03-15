import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/http_client.dart';
import 'package:little_walk/blocs/auth.dart';
import 'package:little_walk/screens/signup.dart';
import 'package:little_walk/components/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => AuthCubit(client: HttpClient.fromEnv()),
        child: Builder(builder: (context) {
          final auth = BlocProvider.of<AuthCubit>(context);
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
                            decoration:
                                const InputDecoration(hintText: "请输入手机号"),
                            onChanged: (value) => auth.setPhone(value),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "请输入密码",
                      ),
                      onChanged: (value) => auth.setPassword(value),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextButton(
                          onPressed: () => auth.login().then((_) {
                                if (Navigator.of(context).canPop()) {
                                  Navigator.of(context).pop();
                                }
                              }).onError((e, stack) {
                                showErrorMessage(context, e!);
                              }),
                          child: const Text("登录"))),
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextButton(
                          child: const Text("去注册"),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignupScreen()));
                          }))
                ],
              )));
        }));
  }
}
