import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:little_walk/apis/client.dart' as client;
import 'package:little_walk/blocs/walking_offer.dart';
import 'package:little_walk/components/buttons/finish_walking_offer_button.dart';
import 'package:little_walk/screens/error_boundary.dart';
import 'package:little_walk/screens/loading.dart';

class WalkRequestWalkingPage extends StatelessWidget {
  const WalkRequestWalkingPage({super.key});

  @override
  Widget build(BuildContext context) {
    BackgroundLocation.startLocationService(distanceFilter: 10);
    final offer = BlocProvider.of<WalkingOfferCubit>(context, listen: true);
    BackgroundLocation.getLocationUpdates((location) {
      offer.reportWalkingLocation(client.Location(
          longitude: location.longitude!, latitude: location.latitude!));
    });
    if (offer.state.error != null) {
      return ErrorBoundary(
          error: offer.state.error!, retry: () => context.pop());
    }
    if (offer.state.isLoading) {
      return const LoadingScreen();
    }
    return Scaffold(
        appBar: AppBar(actions: const []),
        body: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FinishWalkRequestButton(),
            ]));
  }
}
