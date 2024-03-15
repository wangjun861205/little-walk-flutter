import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/walking_offer.dart';
import 'package:little_walk/screens/error_boundary.dart';

class CancelWalkingOfferButton extends StatelessWidget {
  final Function(BuildContext)? afterCancel;
  const CancelWalkingOfferButton({this.afterCancel, super.key});

  @override
  Widget build(BuildContext context) {
    final offer = BlocProvider.of<WalkingOfferCubit>(context, listen: true);
    return TextButton(
        onPressed: () {
          offer.cancel().then((_) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("成功取消")));
            afterCancel?.call(context);
          });
        },
        child: const Text("取消"));
  }
}
