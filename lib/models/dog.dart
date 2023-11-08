import 'package:little_walk/models/dog_breed.dart';

class Dog {
  String id;
  String name;
  String gender;
  DogBreed breed;
  String? portrait;

  Dog(this.id, this.name, this.gender, this.breed, this.portrait);

  factory Dog.fromJSON(Map<String, dynamic> json) {
    return Dog(json["id"], json["name"], json["gender"],
        DogBreed.fromJSON(json["breed"]), json["portrait_id"]);
  }
}
