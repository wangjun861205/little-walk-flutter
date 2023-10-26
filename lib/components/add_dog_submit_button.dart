import 'package:flutter/material.dart';
import '../apis/dog.dart';

class AddDogSubmitButton extends StatelessWidget {
  final String authToken;
  final AddDogRequest dog;
  const AddDogSubmitButton(this.authToken, this.dog, {super.key});

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    Future<void> onPress() async {
      try {
        final resp = await addDog(authToken, dog);
        messenger.showSnackBar(SnackBar(content: Text("success: ${resp.id}")));
      } catch (err) {
        messenger.showSnackBar(SnackBar(
          content: Text(err.toString()),
          duration: const Duration(seconds: 10),
        ));
      }
    }

    return TextButton(onPressed: onPress, child: const Text("创建"));
  }
}
