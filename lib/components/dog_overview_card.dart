import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/components/dog_avatar.dart';

class DogOverviewCard extends StatelessWidget {
  const DogOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dogBloc = BlocProvider.of<DogCubit>(context);
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
        width: screenSize.width * 0.8,
        height: 100,
        child: Row(children: [
          const DogAvatar(),
          Column(children: [
            Text(dogBloc.state.name),
            Text(dogBloc.state.breed.name),
          ])
        ]));
  }
}
