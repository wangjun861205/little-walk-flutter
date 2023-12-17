import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/dog.dart';
import '../apis/dog.dart';

class AddDogSubmitButton extends StatelessWidget {
  const AddDogSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dogBloc = BlocProvider.of<DogValueCubit>(context, listen: true);
    final messenger = ScaffoldMessenger.of(context);
    onPress() {
      addDog(dogBloc.state).then((resp) {
        messenger.showSnackBar(SnackBar(content: Text("success: ${resp.id}")));
        Navigator.of(context).pop(resp);
      }, onError: (err) {
        messenger.showSnackBar(SnackBar(
          content: Text("$err"),
          duration: const Duration(seconds: 10),
        ));
      });
    }

    return TextButton(onPressed: onPress, child: const Text("创建"));
  }
}
