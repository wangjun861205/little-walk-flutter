import 'package:flutter/material.dart';

class PhoneInput extends StatelessWidget {
  final TextEditingController ctrl;

  const PhoneInput({required this.ctrl, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: ctrl,
      decoration: const InputDecoration(hintText: "手机号"),
      keyboardType: TextInputType.phone,
    );
  }
}
