import 'dart:convert';

class Dog {
  String name;
  String portrait;

  Dog(this.name, this.portrait);

  factory Dog.fromJSON(String json) {
    final map = jsonDecode(json);
    return Dog(map["name"], map["portrait"]);
  }
}
