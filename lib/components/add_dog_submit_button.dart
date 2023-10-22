import 'package:flutter/material.dart';

class AddDogSubmitButton extends StatelessWidget {
  final Function() onPress;
  const AddDogSubmitButton(this.onPress, {super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPress, child: const Text("创建"));
  }
}
