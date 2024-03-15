import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/walking_offer.dart';
import 'package:little_walk/screens/error_boundary.dart';
import 'package:little_walk/screens/walking_offer_walking.dart';

class StartWalkingOfferButton extends StatelessWidget {
  final Function(BuildContext)? afterStart;
  const StartWalkingOfferButton({this.afterStart, super.key});
  @override
  Widget build(BuildContext context) {
    final offer = BlocProvider.of<WalkingOfferCubit>(context, listen: true);
    return TextButton(
        onPressed: () {
          offer.start().then((_) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("已开始")));
            afterStart?.call(context);
          });
        },
        child: const Text("开始"));
  }
}
