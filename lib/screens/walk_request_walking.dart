import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/walk_request.dart';
import 'package:little_walk/blocs/walk_request.dart';
import 'package:little_walk/components/finish_walk_request_button.dart';
import 'package:little_walk/models/walk_request.dart';
import 'package:permission_handler/permission_handler.dart';

class WalkRequestWalkingPage extends StatelessWidget {
  const WalkRequestWalkingPage({super.key});

  @override
  Widget build(BuildContext context) {
    BackgroundLocation.startLocationService(distanceFilter: 10);
    final reqBloc = BlocProvider.of<WalkRequestCubit>(context, listen: true);
    BackgroundLocation.getLocationUpdates((position) async => {
          await reportCurrentPosition(
              id: reqBloc.state.id,
              longitude: position.longitude!,
              latitude: position.latitude!)
        });
    return Scaffold(
        appBar: AppBar(actions: const []),
        body: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FinishWalkRequestButton(),
            ]));
  }
}
