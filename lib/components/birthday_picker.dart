import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/dog.dart';

class BirthdayPicker extends StatelessWidget {
  TextEditingController controller;
  BirthdayPicker({super.key}) : controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dogBloc = BlocProvider.of<DogValueCubit>(context);
    return TextField(
        controller: controller,
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
          final dateStr = date != null ? "${date.toIso8601String()}+08:00" : "";
          controller.text = dateStr;
          dogBloc.setBirthday(dateStr);
        });
  }
}
