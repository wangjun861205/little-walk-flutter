import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/dog.dart';
import 'package:little_walk/blocs/dog.dart';

class EditDogSubmitButton extends StatelessWidget {
  final Widget child;

  const EditDogSubmitButton(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    final dogBloc = BlocProvider.of<DogCubit>(context, listen: true);
    return InkWell(
      child: child,
      onTap: () async {
        await updateDog(dogBloc.state);
      },
    );
  }
}
