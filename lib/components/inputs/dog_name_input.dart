import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/dog.dart';

class DogNameInput extends StatelessWidget {
  const DogNameInput({super.key});
  @override
  Widget build(BuildContext context) {
    final dog = BlocProvider.of<DogCubit>(context);
    return TextField(
      decoration: const InputDecoration(
        hintText: "请输入狗狗的名字",
      ),
      onChanged: (value) => dog.setName(value),
    );
  }
}
