import 'package:flutter/material.dart';

class BirthdayPicker extends StatelessWidget {
  final DateTime birthday;
  final void Function(DateTime) setBirthday;

  TextEditingController? dateController;

  BirthdayPicker(this.birthday, this.setBirthday, {super.key}) {
    dateController = TextEditingController(text: birthday.toIso8601String());
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: dateController,
        decoration: const InputDecoration(
            icon: Icon(Icons.calendar_today), labelText: "请选择生日"),
        readOnly: true,
        onTap: () async {
          DateTime? date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );
          setBirthday(date ?? DateTime.now());
        });
  }
}
