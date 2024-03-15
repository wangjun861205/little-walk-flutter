import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/client.dart';
import 'package:little_walk/apis/http_client.dart';
import 'package:little_walk/blocs/common.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/blocs/walking_offer.dart';
import 'package:little_walk/components/images/dog_avatar.dart';
import 'package:little_walk/models/walking_offer.dart';
import 'package:little_walk/screens/walking_offer_detail.dart';

class MyWalkingOffersList extends StatelessWidget {
  const MyWalkingOffersList({super.key});

  @override
  Widget build(BuildContext context) {
    final offers = BlocProvider.of<MyWalkingOffersCubit>(context);
    return ListView(
        children: offers.state.result
            .map((offer) => InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BlocProvider(
                          create: (_) => WalkingOfferCubit(
                              client: HttpClient.fromEnv(), offer: offer),
                          child: const WalkRequestDetailPage())));
                },
                child: Row(children: [
                  ...offer.dogs!
                      .map((dog) => BlocProvider(
                          create: (_) =>
                              DogCubit(client: HttpClient.fromEnv(), dog: dog),
                          child: const DogAvatar(radius: 40)))
                      .toList(),
                  ...offer.dogs!
                      .map((dog) => Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Text(dog.name!)))
                      .toList()
                ])))
            .toList());
  }
}

class NearbyWalkingOffersList extends StatelessWidget {
  const NearbyWalkingOffersList({super.key});

  @override
  Widget build(BuildContext context) {
    final offers = BlocProvider.of<NearbyWalkingOffersCubit>(context);
    return ListView(
        children: offers.state.result
            .map((offer) => InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BlocProvider(
                          create: (_) => WalkingOfferCubit(
                              client: HttpClient.fromEnv(), offer: offer),
                          child: const WalkRequestDetailPage())));
                },
                child: Row(children: [
                  ...offer.dogs!
                      .map((dog) => BlocProvider(
                          create: (_) =>
                              DogCubit(client: HttpClient.fromEnv(), dog: dog),
                          child: const DogAvatar(radius: 40)))
                      .toList(),
                  ...offer.dogs!
                      .map((dog) => Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Text(dog.name!)))
                      .toList()
                ])))
            .toList());
  }
}
