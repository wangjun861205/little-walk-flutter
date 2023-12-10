import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/walk_request.dart';
import 'package:little_walk/components/create_walk_request_button.dart';
import 'package:little_walk/components/dog_select.dart';
import 'package:little_walk/wrappers/location.dart';

class CreateWalkRequestScreen extends StatelessWidget {
  const CreateWalkRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LocationWrapper(
        builder: (context, {required latitude, required longitude}) {
      final reqBloc = BlocProvider.of<WalkRequestValueCubit>(context);
      reqBloc.setLongitude(longitude);
      reqBloc.setLatitude(latitude);
      return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DogSelect(onChanged: (dogs) {
                    reqBloc.setDogIDs(dogs.map((d) => d.id).toList());
                  }),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CreateWalkRequestButton()])
            ]),
          ));
    });
  }
}
