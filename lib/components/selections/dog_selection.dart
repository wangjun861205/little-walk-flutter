import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/http_client.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/blocs/walking_offer.dart';
import 'package:little_walk/components/images/dog_avatar.dart';

class _Item extends StatelessWidget {
  final bool isSelected;

  const _Item({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final dog = BlocProvider.of<DogCubit>(context);
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            side: isSelected
                ? BorderSide(color: Colors.blue.shade300, width: 2)
                : BorderSide.none),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Flexible(child: DogAvatar()),
          Flexible(child: Text(dog.state.result!.name!))
        ]));
  }
}

class DogSelectionForOffer extends StatelessWidget {
  const DogSelectionForOffer({super.key});
  @override
  Widget build(BuildContext context) {
    final offer = BlocProvider.of<WalkingOfferCubit>(context, listen: true);
    final dogs = BlocProvider.of<MyDogsCubit>(context, listen: true);

    return AnimatedGrid(
      itemBuilder: (context, i, animate) {
        return BlocBuilder(
            builder: (context, _) => ScaleTransition(
                  scale:
                      CurvedAnimation(parent: animate, curve: Curves.easeInOut),
                  child: InkWell(
                      onTap: () => offer.containsDog(dogs.state.result[i])
                          ? offer.removeDog(dogs.state.result[i])
                          : offer.addDog(dogs.state.result[i]),
                      child: _Item(
                          isSelected: offer.state.result!.dogs!
                              .contains(dogs.state.result[i]))),
                ),
            bloc: DogCubit(
                client: HttpClient.fromEnv(), dog: dogs.state.result[i]));
      },
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0),
      initialItemCount: dogs.state.result.length,
    );
  }
}
