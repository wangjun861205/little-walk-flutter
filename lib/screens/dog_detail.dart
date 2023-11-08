import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:little_walk/apis/common.dart';
import 'package:little_walk/apis/dog.dart';
import 'package:little_walk/components/portrait_picker.dart';
import 'package:little_walk/models/dog.dart';

class DogDetailScreen extends StatelessWidget {
  final String backendAddress;
  final String authToken;
  final Dog dog;

  const DogDetailScreen(this.backendAddress, this.authToken, this.dog,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Stack(children: [
          Positioned(
              top: 50,
              left: MediaQuery.of(context).size.width * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                      child: Padding(
                          padding: const EdgeInsets.only(top: 80, left: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(dog.name),
                              Text(dog.gender),
                              Text(dog.breed.name)
                            ],
                          )))
                ],
              )),
          Positioned(
              top: 20,
              left: MediaQuery.of(context).size.width * 0.15,
              child: PortraitPicker(backendAddress, authToken, dog.portrait,
                  (portraitID) {
                try {
                  updateDogPortrait(backendAddress, dog.id, portraitID);
                } catch (e) {
                  debugPrint("$e");
                }
              },
                  CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.cyan[800],
                      child: const Text("不二")))),
          Positioned(
              top: 60,
              right: MediaQuery.of(context).size.width * 0.15,
              child: TextButton(onPressed: () {}, child: const Text("编辑信息")))
        ]));
  }
}
