import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/walking_offer.dart';

class CreateWalkingOfferButton extends StatelessWidget {
  final Function(BuildContext)? afterCreate;
  const CreateWalkingOfferButton({this.afterCreate, super.key});

  @override
  Widget build(BuildContext context) {
    final offer = BlocProvider.of<WalkingOfferCubit>(
      context,
    );
    return TextButton(
        onPressed: () {
          offer.create().then((_) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("创建成功")));
            afterCreate?.call(context);
          });
        },
        child: const Text("创建"));
  }
}
