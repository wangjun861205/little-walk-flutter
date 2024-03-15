import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/main.dart';

class DogAvatar extends StatelessWidget {
  final double radius;
  const DogAvatar({this.radius = 50, super.key});
  @override
  Widget build(BuildContext context) {
    final dog = BlocProvider.of<DogCubit>(context, listen: true);

    if (dog.state.result!.portraitID == null) {
      return CircleAvatar(
          radius: radius,
          backgroundColor: Colors.cyan[800],
          child: Text(dog.state.result!.name!));
    }

    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(
          "http://${Config.backendAddress}/apis/uploads/${dog.state.result!.portraitID}",
          headers: {
            "Authorization": "Bearer ${AuthToken.token}",
          }),
    );
  }
}
