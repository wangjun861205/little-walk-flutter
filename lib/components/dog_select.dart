import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/dog.dart';
import 'package:little_walk/blocs/app.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/models/dog.dart';
import 'package:little_walk/screens/add_dog.dart';
import 'package:little_walk/screens/error_boundary.dart';

class DogSelectChip extends StatelessWidget {
  String dogID;
  String dogName;
  String? portraitID;
  bool isSelected;

  DogSelectChip(
      {required this.dogID,
      required this.dogName,
      this.portraitID,
      required this.isSelected,
      super.key});

  @override
  Widget build(BuildContext context) {
    final appCubit = BlocProvider.of<AppCubit>(context);
    return SizedBox(
        width: 100,
        height: 150,
        child: Container(
            decoration: BoxDecoration(
                color: isSelected ? Colors.blue[300] : Colors.blue[100]),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                      backgroundImage: portraitID != null
                          ? NetworkImage(
                              "http://${appCubit.state.backendAddress}/apis/dogs/portraits/$portraitID",
                              headers: {
                                  "X-Auth-Token": appCubit.state.authToken!,
                                })
                          : null),
                  Text(dogName)
                ])));
  }
}

class DogSelectChipRow extends StatefulWidget {
  List<Dog> candidates;
  void Function(List<Dog>) onChanged;

  DogSelectChipRow(
      {required this.candidates, required this.onChanged, super.key});

  @override
  State<StatefulWidget> createState() {
    return DogSelectChipRowState(
        isSelected: Map.fromIterable(candidates,
            key: (dog) => dog.id, value: (dog) => false));
  }
}

class DogSelectChipRowState extends State<DogSelectChipRow> {
  Map<String, bool> isSelected;
  DogSelectChipRowState({required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Row(
        children: widget.candidates.mapIndexed((i, dog) {
      return InkWell(
          onTap: () {
            setState(() {
              isSelected[dog.id!] = !isSelected[dog.id!]!;
              widget.onChanged(widget.candidates
                  .where((dog) => isSelected.keys.contains(dog.id))
                  .toList());
            });
          },
          child: DogSelectChip(
            dogID: dog.id!,
            dogName: dog.name!,
            portraitID: dog.portraitID,
            isSelected: isSelected[dog.id!]!,
          ));
    }).toList());
  }
}

class DogSelect extends StatefulWidget {
  void Function(List<Dog> dogs) onChanged;

  DogSelect({required this.onChanged, super.key});

  @override
  State<StatefulWidget> createState() {
    return DogSelectState();
  }
}

class DogSelectState extends State<DogSelect> {
  List<String> selectedDogs = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: myDogs(limit: 10, skip: 0),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            debugPrint(snapshot.error.toString());
            return Row(children: [
              const Text("出错了"),
              TextButton(onPressed: () {}, child: const Text("重试"))
            ]);
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return const CircularProgressIndicator();
          }
          if (!snapshot.hasData) {
            return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("还没有添加您的爱犬， 去"),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return BlocProvider(
                          create: (_) => DogCubit(const Dog()),
                          child: const AddDogScreen());
                    }));
                  },
                  child: const Text("添加"))
            ]);
          }
          return DogSelectChipRow(
              candidates: snapshot.data!.$1, onChanged: widget.onChanged);
        });
  }
}
