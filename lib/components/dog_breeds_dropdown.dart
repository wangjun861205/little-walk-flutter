import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/dog.dart';
import 'package:little_walk/blocs/dog.dart';
import '../models/dog_breed.dart';

class CategoryDropdown extends StatelessWidget {
  const CategoryDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final dogBloc = BlocProvider.of<DogValueCubit>(context, listen: true);
    final breedsBloc = BlocProvider.of<DogBreedsCubit>(context, listen: true);
    return DropdownButton(
      hint: const Text("请选择狗狗的类别"),
      value: dogBloc.state.breed?.category,
      items: const [
        DropdownMenuItem(value: "Small", child: Text("小型犬")),
        DropdownMenuItem(value: "Medium", child: Text("中型犬")),
        DropdownMenuItem(value: "Large", child: Text("大型犬")),
        DropdownMenuItem(value: "Giant", child: Text("超大型犬")),
      ],
      onChanged: (category) async {
        dogBloc.setBreed(DogBreedValue(category: category));
        final breeds = await fetchBreeds(category: category);
        breedsBloc.set(breeds);
      },
    );
  }
}

class BreedDropdown extends StatelessWidget {
  const BreedDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final dogBloc = BlocProvider.of<DogValueCubit>(context, listen: true);
    final breedsBloc = BlocProvider.of<DogBreedsCubit>(context, listen: true);
    return DropdownButton(
        hint: const Text("请选择狗狗的品种"),
        value: dogBloc.state.breed?.id,
        items: breedsBloc.state
            .map((b) => DropdownMenuItem(value: b.id, child: Text(b.name)))
            .toList(),
        onChanged: (val) {
          if (val == null) {
            return;
          }
          dogBloc.setBreed(
              DogBreedValue(id: val, category: dogBloc.state.breed!.category));
        });
  }
}

class DogBreedsDropdownGroup extends StatelessWidget {
  const DogBreedsDropdownGroup({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => DogBreedsCubit([]),
        child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CategoryDropdown(), BreedDropdown()]));
  }
}
