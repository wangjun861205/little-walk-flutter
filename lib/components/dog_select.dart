import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/components/dog_avatar.dart';
import 'package:little_walk/components/dog_overview_card.dart';
import 'package:little_walk/models/dog.dart';
import 'package:little_walk/screens/error_boundary.dart';

class DogSelect extends StatelessWidget {
  final List<Dog> selected;
  final void Function(Dog dog) onTap;
  const DogSelect({required this.selected, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final myDogs = BlocProvider.of<MyDogsCubit>(context, listen: true);
    if (myDogs.error != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              ErrorBoundary(error: myDogs.error!, retry: () => myDogs.next())));
      return Container();
    }
    if (myDogs.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    List<Widget> selectedAvatars = selected
        .map((dog) => BlocProvider(
            create: (_) => DogCubit(myDogs.state.firstWhere((d) => d == dog)),
            child: const Expanded(child: DogAvatar())))
        .toList();
    List<Widget> candidates = myDogs.state
        .map((dog) => InkWell(
            onTap: () => onTap(dog),
            child: BlocProvider(
                create: (_) => DogCubit(dog),
                child: Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: const DogOverviewCard(),
                ))))
        .toList();
    return Column(children: [Row(children: selectedAvatars), ...candidates]);
  }
}
