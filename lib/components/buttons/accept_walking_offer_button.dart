import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/walking_offer.dart';
import 'package:little_walk/screens/error_boundary.dart';

class AcceptWalkingOfferButton extends StatelessWidget {
  final Function(BuildContext)? afterAccept;
  const AcceptWalkingOfferButton({this.afterAccept, super.key});
  @override
  Widget build(BuildContext context) {
    final req = BlocProvider.of<WalkingOfferCubit>(context, listen: true);
    return TextButton(
        onPressed: () {
          req.accept().then((_) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("接单成功")));
            afterAccept?.call(context);
          });
        },
        child: const Text("接单"));
  }
}
