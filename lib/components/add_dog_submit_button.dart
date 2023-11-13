import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/dog.dart';
import '../apis/dog.dart';

class AddDogSubmitButton extends StatelessWidget {
  const AddDogSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dogBloc = BlocProvider.of<DogCubit>(context);
    final messenger = ScaffoldMessenger.of(context);
    Future<void> onPress() async {
      try {
        final resp = await addDog(dogBloc.state);
        messenger.showSnackBar(SnackBar(content: Text("success: ${resp.id}")));
      } catch (err) {
        messenger.showSnackBar(SnackBar(
          content: Text("$err"),
          duration: const Duration(seconds: 10),
        ));
      }
    }

    return TextButton(onPressed: onPress, child: const Text("创建"));
  }
}
