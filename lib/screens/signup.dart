import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:little_walk/apis/auth.dart';
import 'package:little_walk/apis/common.dart';
import 'package:little_walk/components/send_verification_code_button.dart';
import 'package:little_walk/screens/home.dart';

class SignupScreen extends StatefulWidget {
  final String backendAddress;

  const SignupScreen(this.backendAddress, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignupScreenState();
  }
}

class _SignupScreenState extends State<SignupScreen> {
  String phone = "";
  String password = "";
  String repeat = "";
  String verificationCode = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.only(top: 100.0, left: 30, right: 30),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          phone = value;
                        });
                      },
                      decoration: const InputDecoration(hintText: "请输入手机号"),
                    ),
                  ),
                  Expanded(
                    child: SendVerificationCodeButton(phone, 60),
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
                onChanged: (value) => {
                  setState(() {
                    verificationCode = value;
                  })
                },
              ))
            ]),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "请输入密码",
                        errorText: repeat == "" || password == repeat
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
                onChanged: (value) => {
                  setState(() {
                    repeat = value;
                  })
                },
              ))
            ]),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: password == repeat
                          ? () {
                              signup(phone, password, verificationCode)
                                  .then((token) {
                                putAuthToken(token);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomeScreen(
                                        widget.backendAddress, token)));
                              }).catchError((e) {
                                ScaffoldMessenger.of(context).showSnackBar(
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
  }
}
