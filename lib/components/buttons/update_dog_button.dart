import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/dog.dart';

class UpdateDogButton extends StatelessWidget {
  final Function(BuildContext)? afterUpdate;

  const UpdateDogButton({this.afterUpdate, super.key});

  @override
  Widget build(BuildContext context) {
    final dog = BlocProvider.of<DogCubit>(context, listen: true);
    return TextButton(
        onPressed: () {
          dog.updateDog().then((_) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("更新成功")));
            afterUpdate?.call(context);
          });
        },
        child: const Text("更新"));
  }
}
