import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/http_client.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/components/buttons/add_dog_button.dart';
import 'package:little_walk/components/inputs/dog_name_input.dart';
import 'package:little_walk/models/dog.dart';
import '../components/selections/birthday_picker.dart';
import '../components/selections/dog_breeds_dropdown.dart';
import '../components/inputs/gender_radio_group.dart';
import '../components/selections/portrait_picker.dart';

class AddDogScreen extends StatelessWidget {
  const AddDogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => DogCubit(client: HttpClient.fromEnv(), dog: const Dog()),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("添加狗狗"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const DogNameInput(),
                const BreedDropdown(),
                const GenderRadioGroup(),
                BirthdayPicker(),
                const DogPortraitPicker(Text("上传头像")),
                const AddDogButton(),
              ],
            ),
          ),
        ));
  }
}
