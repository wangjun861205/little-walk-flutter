class DogBreed {
  String id;
  String category;
  String name;

  DogBreed(this.id, this.category, this.name);

  factory DogBreed.fromJSON(Map<String, dynamic> json) {
    return DogBreed(json["id"], json["category"], json["name"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "category": category, "name": name};
  }
}
