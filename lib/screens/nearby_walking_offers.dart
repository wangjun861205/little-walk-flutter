import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/http_client.dart';
import 'package:little_walk/blocs/walking_offer.dart';
import 'package:little_walk/models/walking_offer.dart';
import 'package:little_walk/screens/create_walk_request.dart';
import 'package:little_walk/screens/error_boundary.dart';
import 'package:little_walk/screens/loading.dart';

class NearbyWalkingOffersScreen extends StatelessWidget {
  const NearbyWalkingOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) =>
            NearbyWalkingOffersCubit(client: HttpClient.fromEnv())..query(),
        child: Builder(builder: (context) {
          final offers = BlocProvider.of<NearbyWalkingOffersCubit>(context);
          if (offers.state.error != null) {
            return ErrorBoundary(
              error: offers.state.error!,
              retry: () => offers.query(),
            );
          }
          if (offers.state.isLoading) {
            return const LoadingScreen();
          }
          return Scaffold(
              appBar: AppBar(actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BlocProvider(
                                create: (_) => WalkingOfferCubit(
                                    client: HttpClient.fromEnv(),
                                    offer: const WalkingOffer()),
                                child: const CreateWalkingOfferScreen(),
                              )));
                    },
                    icon: const Icon(Icons.add))
              ]),
              body: RefreshIndicator(
                  child: ListView.builder(
                      itemCount: offers.state.result.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          title: Text(offers.state.result[i].dogs != null
                              ? offers.state.result[i].dogs!
                                  .map((d) => d.name)
                                  .join(", ")
                              : ""),
                        );
                      }),
                  onRefresh: () async => offers.query()));
        }));
  }
}
