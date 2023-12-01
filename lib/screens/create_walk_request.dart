import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/walk_request.dart';
import 'package:little_walk/components/dog_select.dart';
import 'package:little_walk/models/dog.dart';
import 'package:little_walk/screens/error_boundary.dart';
import 'package:little_walk/screens/home.dart';
import 'package:little_walk/screens/process_indicator.dart';
import 'package:little_walk/utils/geolocation.dart';

class CreateWalkRequestScreen extends StatelessWidget {
  const CreateWalkRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getCurrentLocation(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorBoundary(error: snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return const ProcessIndicatorScreen();
          }
          if (snapshot.data == null) {
            return const ErrorBoundary(error: "获取定位失败");
          }
          final reqBloc = BlocProvider.of<WalkRequestCubit>(context);
          reqBloc.setLongitude(snapshot.data!.$1);
          reqBloc.setLatitude(snapshot.data!.$2);
          return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Column(children: [
                  DogSelect(onChanged: (dogIDs) {
                    reqBloc.setDogs(dogIDs.map((id) {
                      var dog = Dog(id: id);
                      return dog;
                    }).toList());
                  }),
                ]),
              ));
        });
  }
}
