import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/dog.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/components/dog_breeds_dropdown.dart';
import '../models/dog.dart';

class EditDogScreen extends StatelessWidget {
  const EditDogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dogBloc = BlocProvider.of<DogCubit>(context);
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: TextEditingController()
                      ..text = dogBloc.state.name,
                    decoration: const InputDecoration(labelText: "狗狗名字"),
                    onChanged: (name) => context.read<DogCubit>().setName(name),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: ListTile(
                  title: const Text("男生"),
                  leading: Radio(
                      value: "Male",
                      groupValue: dogBloc.state.gender,
                      onChanged: (gender) =>
                          context.read<DogCubit>().setGender(gender!)),
                )),
                Flexible(
                    child: ListTile(
                        title: const Text("女生"),
                        leading: Radio(
                            value: "Famale",
                            groupValue: dogBloc.state.gender,
                            onChanged: (gender) =>
                                context.read<DogCubit>().setGender(gender!))))
              ],
            ),
            Row(
              children: [
                FutureBuilder(
                    future:
                        fetchBreeds(category: dogBloc.state.breed!.category),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        throw snapshot.error as Error;
                      }
                      if (snapshot.connectionState != ConnectionState.done) {
                        return const CircularProgressIndicator();
                      }
                      return BlocProvider(
                          create: (_) => DogBreedsCubit(DogBreeds(
                              dogBloc.state.breed!.category, snapshot.data!)),
                          child: const Flexible(child: DogBreedsDropdown()));
                    })
              ],
            )
          ],
        ));
  }
}
