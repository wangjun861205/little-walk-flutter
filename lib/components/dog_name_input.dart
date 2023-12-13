import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/dog.dart';

class DogNameInput extends StatelessWidget {
  const DogNameInput({super.key});
  @override
  Widget build(BuildContext context) {
    final dogBloc = BlocProvider.of<DogValueCubit>(context);
    return TextField(
      decoration: const InputDecoration(
        hintText: "请输入狗狗的名字",
      ),
      onChanged: (value) => dogBloc.setName(value),
    );
  }
}
