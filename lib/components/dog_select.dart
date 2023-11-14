import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/dog.dart';
import 'package:little_walk/blocs/app.dart';
import 'package:little_walk/models/dog.dart';

class DogSelectChip extends StatelessWidget {
  String dogID;
  String dogName;
  bool isSelected;

  DogSelectChip(
      {required this.dogID,
      required this.dogName,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                      backgroundImage: NetworkImage(
                          "http://${appCubit.state.backendAddress}/dogs/$dogID/portrait",
                          headers: {
                        "X-Auth-Token": appCubit.state.authToken!,
                      })),
                  Text(dogName)
                ])));
  }
}

class DogSelectChipRow extends StatefulWidget {
  List<Dog> candidates;
  void Function(List<String>) onChanged;

  DogSelectChipRow(
      {required this.candidates, required this.onChanged, super.key});

  @override
  State<StatefulWidget> createState() {
    return DogSelectChipRowState();
  }
}

class DogSelectChipRowState extends State<DogSelectChipRow> {
  late List<bool> isSelected;
  @override
  Widget build(BuildContext context) {
    isSelected = List.filled(widget.candidates.length, false);
    return Row(
        children: widget.candidates.mapIndexed((i, dog) {
      return InkWell(
          onTap: () {
            setState(() {
              isSelected[i] = !isSelected[i];
            });
          },
          child: DogSelectChip(
            dogID: dog.id,
            dogName: dog.name,
            isSelected: isSelected[i],
          ));
    }).toList());
  }
}

class DogSelect extends StatefulWidget {
  void Function(List<String> dogs) onChanged;

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
        future: myDogs(1, 10),
        builder: (context, snapshot) {
          return DogSelectChipRow(
              candidates: snapshot.data!.$1, onChanged: widget.onChanged);
        });
  }
}
