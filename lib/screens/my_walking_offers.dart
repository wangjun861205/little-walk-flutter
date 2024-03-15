import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/http_client.dart';
import 'package:little_walk/blocs/walking_offer.dart';

class MyWalkingOffersScreen extends StatelessWidget {
  const MyWalkingOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) =>
            MyWalkingOffersCubit(client: HttpClient.fromEnv())..query(),
        child: Builder(
          builder: (context) {
            final offers = BlocProvider.of<MyWalkingOffersCubit>(context);
            return ListView.builder(
                itemBuilder: (context, i) => ListTile(
                    title: Text(offers.state.result[i].dogs != null
                        ? offers.state.result[i].dogs!
                            .map((d) => d.name)
                            .join(", ")
                        : "")));
          },
        ));
  }
}
