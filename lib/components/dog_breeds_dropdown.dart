import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/common.dart';
import 'package:little_walk/apis/dog.dart';
import 'package:little_walk/apis/dog_breed.dart';
import 'package:little_walk/blocs/dog.dart';
import '../models/dog_breed.dart';

class DogBreedsDropdown extends StatelessWidget {
  const DogBreedsDropdown({super.key});
  @override
  Widget build(BuildContext context) {
    final breedsBloc = BlocProvider.of<DogBreedsCubit>(context, listen: true);
    final dogBloc = BlocProvider.of<DogCubit>(context, listen: true);
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      DropdownButton(
        value: breedsBloc.state.category,
        items: const [
          DropdownMenuItem(value: "", child: Text("请选择狗狗的类别")),
          DropdownMenuItem(value: "Small", child: Text("小型犬")),
          DropdownMenuItem(value: "Medium", child: Text("中型犬")),
          DropdownMenuItem(value: "Large", child: Text("大型犬")),
          DropdownMenuItem(value: "Giant", child: Text("超大型犬")),
        ],
        onChanged: (category) async {
          breedsBloc.refresh(category!);
        },
      ),
      DropdownButton(
          value: breedsBloc.state.breed,
          items: breedsBloc.state.breeds.map((b) {
            return DropdownMenuItem(value: b.id, child: Text(b.name));
          }).toList()
            ..insert(
                0, const DropdownMenuItem(value: "", child: Text("请选择狗狗的品种"))),
          onChanged: (val) {
            if (val == null) {
              return;
            }
            dogBloc.setBreed(DogBreed(val, "", ""));
          })
    ]);
  }
}
