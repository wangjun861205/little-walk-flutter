import 'package:flutter/material.dart';
import 'package:little_walk/apis/common.dart';
import 'package:little_walk/apis/dog_breed.dart';
import '../models/dog_breed.dart';

class DogBreedsDropdown extends StatefulWidget {
  final String selected;
  final void Function(String) setSelected;
  const DogBreedsDropdown(this.selected, this.setSelected, {super.key});

  @override
  State<DogBreedsDropdown> createState() => _DogBreedsDropdownState();
}

class _DogBreedsDropdownState extends State<DogBreedsDropdown> {
  String size = "";
  List<DogBreed> breeds = [];

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      DropdownButton(
        value: size,
        items: const [
          DropdownMenuItem(value: "", child: Text("请选择狗狗的类别")),
          DropdownMenuItem(value: "Small", child: Text("小型犬")),
          DropdownMenuItem(value: "Medium", child: Text("中型犬")),
          DropdownMenuItem(value: "Large", child: Text("大型犬")),
          DropdownMenuItem(value: "Giant", child: Text("超大型犬")),
        ],
        onChanged: (value) async {
          try {
            if (value == null || value == "") {
              return;
            }
            final resp = await queryBreeds(value, Pagination(1, 10));
            setState(() {
              size = value;
              breeds = resp.list;
            });
          } catch (err) {
            messenger.showSnackBar(SnackBar(content: Text(err.toString())));
          }
        },
      ),
      DropdownButton(
          value: widget.selected,
          items: breeds.map((b) {
            return DropdownMenuItem(value: b.id, child: Text(b.name));
          }).toList()
            ..insert(
                0, const DropdownMenuItem(value: "", child: Text("请选择狗狗的品种"))),
          onChanged: (val) {
            if (val == null) {
              return;
            }
            widget.setSelected(val);
          })
    ]);
  }
}
