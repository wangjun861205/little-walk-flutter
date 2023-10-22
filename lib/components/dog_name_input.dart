import 'package:flutter/material.dart';

class DogNameInput extends StatelessWidget {
  final Function(String?) setName;
  const DogNameInput(this.setName, {super.key});
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: "请输入狗狗的名字",
      ),
      onChanged: (value) => setName(value),
    );
  }
}
