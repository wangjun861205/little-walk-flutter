import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/http_client.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/blocs/walking_offer.dart';
import 'package:little_walk/components/buttons/accept_walking_offer_button.dart';
import 'package:little_walk/components/compounds/dog_overview_card.dart';
import 'package:little_walk/components/buttons/start_walk_request_button.dart';

class WalkRequestDetailPage extends StatelessWidget {
  const WalkRequestDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final offer = BlocProvider.of<WalkingOfferCubit>(context, listen: true);

    return Scaffold(
        appBar: AppBar(),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ...offer.state.result!.dogs!
              .map((dog) => BlocProvider(
                  create: (_) =>
                      DogCubit(client: HttpClient.fromEnv(), dog: dog),
                  child: const DogOverviewCard()))
              .toList(),
          if (offer.state.result!.canceledAt != null)
            const Text("订单已取消")
          else if (offer.state.result!.finishedAt != null)
            const Text("订单已完成")
          else if (offer.state.result!.acceptedAt != null)
            const StartWalkingOfferButton()
          else
            const AcceptWalkingOfferButton()
        ]));
  }
}
