import 'package:flutter/material.dart';

class GenderRadioGroup extends StatelessWidget {
  final String gender;
  final void Function(String) setGender;

  const GenderRadioGroup(this.gender, this.setGender, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Flexible(
          child: ListTile(
        title: const Text("男生"),
        leading: Radio(
            value: "Male",
            groupValue: gender,
            onChanged: (value) {
              setGender(value ?? "");
            }),
      )),
      Flexible(
          child: ListTile(
        title: const Text("女生"),
        leading: Radio(
            value: "Famale",
            groupValue: gender,
            onChanged: (value) {
              setGender(value ?? "");
            }),
      ))
    ]);
  }
}
