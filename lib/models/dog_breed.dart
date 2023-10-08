class DogBreed {
  String id;
  String name;

  DogBreed(this.id, this.name);

  factory DogBreed.fromJSON(Map<String, dynamic> json) {
    return DogBreed(json["id"], json["name"]);
  }
}
