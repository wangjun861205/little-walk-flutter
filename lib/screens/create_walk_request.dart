import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/walk_request.dart';
import 'package:little_walk/components/dog_select.dart';
import 'package:little_walk/models/dog.dart';

class CreateWalkRequestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reqBloc = BlocProvider.of<WalkRequestCubit>(context);
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(children: [
            DogSelect(onChanged: (dogIDs) {
              reqBloc.setDogs(dogIDs.map((id) {
                var dog = Dog.empty();
                dog.id = id;
                return dog;
              }).toList());
            })
          ]),
        ));
  }
}
