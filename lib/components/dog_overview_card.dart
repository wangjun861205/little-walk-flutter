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
        width: screenSize.width * 0.9,
        height: 100,
        child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Padding(
                padding: EdgeInsets.only(left: screenSize.width * 0.05),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const DogAvatar(radius: 40),
                      Container(
                          margin: const EdgeInsets.only(left: 30),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(dogBloc.state.name),
                                Text(dogBloc.state.breed.name),
                              ]))
                    ]))));
  }
}
