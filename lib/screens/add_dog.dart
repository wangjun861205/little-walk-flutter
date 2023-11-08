import 'package:flutter/material.dart';
import 'package:little_walk/apis/dog.dart';
import 'package:little_walk/components/add_dog_submit_button.dart';
import 'package:little_walk/components/dog_name_input.dart';
import '../components/birthday_picker.dart';
import '../components/dog_breeds_dropdown.dart';
import '../components/dog_tags_input.dart';
import '../components/gender_radio_group.dart';
import '../components/portrait_picker.dart';

class AddDogScreenState extends State<AddDogScreen> {
  String name = "";
  String breed = "";
  List<String> tags = [];
  String gender = "Male";
  DateTime birthday = DateTime.now();
  String portrait = "";
  String authToken = "";

  void setName(String? name) {
    setState(() => name = name);
  }

  void setBreed(String b) {
    setState(() {
      breed = b;
    });
  }

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("添加狗狗"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DogNameInput(setName),
            DogBreedsDropdown(breed, setBreed),
            DogTagsInput(tags, addTag, removeTag),
            GenderRadioGroup(gender, setGender),
            BirthdayPicker(birthday, setBirthday),
            PortraitPicker(widget.backendAddress, authToken, portrait,
                setPortrait, const Text("上传头像")),
            AddDogSubmitButton(
                "",
                AddDogRequest(name, gender, breed, birthday, false, "", "1",
                    tags, portrait)),
          ],
        ),
      ),
    );
  }
}

class AddDogScreen extends StatefulWidget {
  final String backendAddress;
  const AddDogScreen(this.backendAddress, {super.key});
  @override
  State<AddDogScreen> createState() => AddDogScreenState();
}
