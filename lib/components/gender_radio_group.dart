import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/dog.dart';

class GenderRadioGroup extends StatelessWidget {
  const GenderRadioGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final dogBloc = BlocProvider.of<DogValueCubit>(context, listen: true);

    return Row(children: [
      Flexible(
          child: ListTile(
        title: const Text("男生"),
        leading: Radio(
            value: "Male",
            groupValue: dogBloc.state.gender,
            onChanged: (value) {
              if (value != null) dogBloc.setGender(value);
            }),
      )),
      Flexible(
          child: ListTile(
        title: const Text("女生"),
        leading: Radio(
            value: "Famale",
            groupValue: dogBloc.state.gender,
            onChanged: (value) {
              if (value != null) dogBloc.setGender(value);
            }),
      ))
    ]);
  }
}
