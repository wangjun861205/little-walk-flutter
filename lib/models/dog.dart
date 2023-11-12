import 'package:little_walk/models/dog_breed.dart';

class Dog {
  String id;
  String name;
  String gender;
  DogBreed? breed;
  String? portraitID;

  Dog(this.id, this.name, this.gender, this.breed, this.portraitID);

  factory Dog.fromJSON(Map<String, dynamic> json) {
    return Dog(json["id"], json["name"], json["gender"],
        DogBreed.fromJSON(json["breed"]), json["portrait_id"]);
  }

  factory Dog.empty() {
    return Dog("", "", "", null, null);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "gender": gender,
      "breed": breed?.toJson(),
      "portrait_id": portraitID,
    };
  }
}
