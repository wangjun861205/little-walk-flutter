import 'package:flutter/material.dart';
import '../apis/auth.dart';
import 'dart:async';

class _SendVerificationCodeButtonState
    extends State<SendVerificationCodeButton> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Visibility(
        visible: counter == 0,
        child: TextButton(
            onPressed: () {
              try {
                acquireSMSVerificationCode(widget.phone);
                setState(() {
                  counter = widget.interval;
                  Timer.periodic(const Duration(seconds: 1), (timer) {
                    if (counter == 0) {
                      timer.cancel();
                      return;
                    }
                    setState(() {
                      counter--;
                    });
                  });
                });
              } catch (err) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(err.toString())));
              }
            },
            child: const Text("获取验证码")),
      ),
      Visibility(
        visible: counter > 0,
        child: Text("$counter"),
      )
    ]);
  }
}

class SendVerificationCodeButton extends StatefulWidget {
  final String phone;
  final int interval;
  const SendVerificationCodeButton(this.phone, this.interval, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _SendVerificationCodeButtonState();
  }
}
