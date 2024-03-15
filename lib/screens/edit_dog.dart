import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/dog.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/components/selections/dog_breeds_dropdown.dart';
import 'package:little_walk/components/buttons/update_dog_button.dart';
import 'package:little_walk/components/inputs/gender_radio_group.dart';

class EditDogScreen extends StatelessWidget {
  const EditDogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dogBloc = BlocProvider.of<DogCubit>(context, listen: true);
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: TextEditingController()
                      ..text = dogBloc.state.result!.name!,
                    decoration: const InputDecoration(labelText: "狗狗名字"),
                    onChanged: (name) => context.read<DogCubit>().setName(name),
                  ),
                )
              ],
            ),
            const GenderRadioGroup(),
            Row(
              children: [
                FutureBuilder(
                    future: fetchBreeds(
                        category: dogBloc.state.result!.breed!.category),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        throw snapshot.error as Error;
                      }
                      if (snapshot.connectionState != ConnectionState.done) {
                        return const CircularProgressIndicator();
                      }

                      return const Flexible(child: BreedDropdown());
                    })
              ],
            ),
            const Row(
              children: [Flexible(child: UpdateDogButton())],
            )
          ],
        ));
  }
}
