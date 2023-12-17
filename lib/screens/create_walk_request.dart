import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/dog.dart';
import 'package:little_walk/blocs/common.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/blocs/walk_request.dart';
import 'package:little_walk/components/create_walk_request_button.dart';
import 'package:little_walk/components/dog_select.dart';
import 'package:little_walk/models/dog.dart';
import 'package:little_walk/wrappers/location.dart';

class CreateWalkRequestScreen extends StatelessWidget {
  const CreateWalkRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LocationWrapper(
        builder: (context, {required latitude, required longitude}) {
      final reqBloc =
          BlocProvider.of<WalkRequestValueCubit>(context, listen: true);
      void onTap(Dog dog) {
        if (reqBloc.state.dogs == null || reqBloc.state.dogs!.isEmpty) {
          reqBloc.setDogs([dog]);
          return;
        }
        if (reqBloc.state.dogs!.contains(dog)) {
          reqBloc.setDogs(reqBloc.state.dogs!.where((v) => v != dog).toList());
          return;
        }
        reqBloc.setDogs([...reqBloc.state.dogs!, dog]);
      }

      reqBloc.setLongitude(longitude);
      reqBloc.setLatitude(latitude);
      return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: ListView(children: [
              Expanded(
                  child: BlocProvider(
                      create: (_) => FutureCubit<List<Dog>, int>(
                          factory: (dogs, arg) => myDogs(limit: 10, skip: 0),
                          initData: [],
                          arg: 0),
                      child: DogSelect(
                          selected: reqBloc.state.dogs ?? [], onTap: onTap))),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CreateWalkRequestButton()])
            ]),
          ));
    });
  }
}
