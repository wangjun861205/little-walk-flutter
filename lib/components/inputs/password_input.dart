import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController ctrl;

  const PasswordInput({required this.ctrl, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: ctrl,
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        decoration: const InputDecoration(hintText: "密码"));
  }
}
