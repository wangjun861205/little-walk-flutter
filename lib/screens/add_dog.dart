import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/dog.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/components/add_dog_submit_button.dart';
import 'package:little_walk/components/dog_name_input.dart';
import 'package:little_walk/models/dog.dart';
import '../components/birthday_picker.dart';
import '../components/dog_breeds_dropdown.dart';
import '../components/dog_tags_input.dart';
import '../components/gender_radio_group.dart';
import '../components/portrait_picker.dart';

class AddDogScreenState extends State<AddDogScreen> {
  List<String> tags = [];
  String gender = "Male";
  DateTime birthday = DateTime.now();
  String portrait = "";
  String authToken = "";

  void addTag(String tag) {
    setState(() {
      tags.add(tag);
    });
  }

  void removeTag(String tag) {
    setState(() {
      tags.remove(tag);
    });
  }

  void setGender(String gender) {
    setState(() {
      this.gender = gender;
    });
  }

  void setBirthday(DateTime birthday) {
    setState(() {
      this.birthday = birthday;
    });
  }

  void setPortrait(String portrait) {
    setState(() {
      portrait = portrait;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => DogCubit(Dog.empty()),
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
                BlocProvider(
                  create: (_) => DogBreedsCubit(DogBreeds.empty()),
                  child: const DogBreedsDropdown(),
                ),
                DogTagsInput(tags, addTag, removeTag),
                const GenderRadioGroup(),
                BirthdayPicker(birthday, setBirthday),
                const DogPortraitPicker(Text("上传头像")),
                AddDogSubmitButton(
                    "",
                    AddDogRequest(name, gender, breed, birthday, false, "", "1",
                        tags, portrait)),
              ],
            ),
          ),
        ));
  }
}

class AddDogScreen extends StatefulWidget {
  const AddDogScreen({super.key});
  @override
  State<AddDogScreen> createState() => AddDogScreenState();
}
