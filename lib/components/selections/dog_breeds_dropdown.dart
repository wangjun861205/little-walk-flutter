import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/http_client.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/main.dart';
import 'package:little_walk/models/dog.dart';

class BreedDropdown extends StatelessWidget {
  const BreedDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final dog = BlocProvider.of<DogCubit>(context, listen: true);
    final breeds = BreedsCubit(
        client: HttpClient(
            address: Config.backendAddress!, authToken: AuthToken.token))
      ..query();
    return BlocBuilder(
      bloc: breeds,
      builder: (context, _) {
        return DropdownSearch<Breed>(
            popupProps: const PopupProps.menu(showSelectedItems: true),
            items: breeds.state.result,
            selectedItem: dog.state.result!.breed,
            onChanged: (value) {
              if (value != null) {
                dog.setBreed(value);
              }
            });
      },
    );
  }
}
