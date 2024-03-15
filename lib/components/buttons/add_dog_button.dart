import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/dog.dart';

class AddDogButton extends StatelessWidget {
  final Function(BuildContext)? afterAdd;
  const AddDogButton({this.afterAdd, super.key});

  @override
  Widget build(BuildContext context) {
    final dog = BlocProvider.of<DogCubit>(context, listen: true);
    onPress() {
      dog.addDog().then((_) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("添加成功")));
        afterAdd?.call(context);
      });
    }

    return TextButton(onPressed: onPress, child: const Text("添加"));
  }
}
