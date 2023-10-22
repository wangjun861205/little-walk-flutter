import 'package:flutter/material.dart';
import 'package:little_walk/apis/common.dart';
import 'package:little_walk/apis/dog_breed.dart';
import '../models/dog_breed.dart';

class DogBreedsDropdown extends StatefulWidget {
  String? selected;
  void Function(String?) setSelected;
  DogBreedsDropdown(this.selected, this.setSelected, {super.key});

  @override
  State<DogBreedsDropdown> createState() => _DogBreedsDropdownState();
}

class _DogBreedsDropdownState extends State<DogBreedsDropdown> {
  late Future<ListResp<DogBreed>> future;
  String? size;

  @override
  void initState() {
    super.initState();
    future = queryBreeds("Small", Pagination(1, 10));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("${snapshot.error}\n");
          }
          if (snapshot.hasData) {
            return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              DropdownButton(
                value: size ?? "Small",
                items: const [
                  DropdownMenuItem(value: "Small", child: Text("小型犬")),
                  DropdownMenuItem(value: "Medium", child: Text("中型犬")),
                  DropdownMenuItem(value: "Large", child: Text("大型犬")),
                  DropdownMenuItem(value: "Giant", child: Text("超大型犬")),
                ],
                onChanged: (value) {
                  setState(() {
                    size = value;
                    widget.setSelected(null);
                    future = queryBreeds(value, Pagination(1, 10));
                  });
                },
              ),
              DropdownButton(
                  value: widget.selected,
                  items: snapshot.data?.list.map((b) {
                    return DropdownMenuItem(value: b.id, child: Text(b.name));
                  }).toList(),
                  onChanged: (val) {
                    print("selected: $val");
                    widget.setSelected(val);
                  })
            ]);
          }
          return const CircularProgressIndicator();
        });
  }
}
