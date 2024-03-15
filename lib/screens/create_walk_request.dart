import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/http_client.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/blocs/walking_offer.dart';
import 'package:little_walk/components/buttons/create_walking_offer_button.dart';
import 'package:little_walk/components/selections/dog_selection.dart';

class CreateWalkingOfferScreen extends StatelessWidget {
  const CreateWalkingOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => WalkingOfferCubit(client: HttpClient.fromEnv())),
          BlocProvider(
            create: (_) => MyDogsCubit(client: HttpClient.fromEnv()),
          )
        ],
        child: Scaffold(
          appBar: AppBar(),
          body: const Column(children: [
            Expanded(child: DogSelectionForOffer()),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CreateWalkingOfferButton()])
          ]),
        ));
  }
}
