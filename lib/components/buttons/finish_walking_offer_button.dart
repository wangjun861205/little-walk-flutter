import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/walking_offer.dart';
import 'package:little_walk/screens/error_boundary.dart';

class FinishWalkRequestButton extends StatelessWidget {
  final Function(BuildContext)? afterFinish;
  const FinishWalkRequestButton({this.afterFinish, super.key});

  @override
  Widget build(BuildContext context) {
    final offer = BlocProvider.of<WalkingOfferCubit>(context, listen: true);
    return TextButton(
        onPressed: () {
          BackgroundLocation.stopLocationService();
          offer.finish().then((_) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("已结束")));
            afterFinish?.call(context);
          });
        },
        child: const Text("结束"));
  }
}
