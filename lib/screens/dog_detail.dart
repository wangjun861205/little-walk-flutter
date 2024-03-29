import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/components/images/dog_avatar.dart';
import 'package:little_walk/screens/edit_dog.dart';

class DogDetailScreen extends StatelessWidget {
  const DogDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dog = BlocProvider.of<DogCubit>(context, listen: true);
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
                              Text(dog.state.result!.name!),
                              Text(dog.state.result!.gender!),
                              Text(dog.state.result!.breed!.name!),
                            ],
                          )))
                ],
              )),
          Positioned(
              top: 20,
              left: MediaQuery.of(context).size.width * 0.15,
              child: const DogAvatar()),
          Positioned(
              top: 60,
              right: MediaQuery.of(context).size.width * 0.15,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return BlocProvider.value(
                          value: dog, child: const EditDogScreen());
                    }));
                  },
                  child: const Text("编辑信息")))
        ]));
  }
}
