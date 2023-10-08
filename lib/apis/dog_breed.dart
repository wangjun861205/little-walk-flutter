import "../models/dog_breed.dart";
import "./common.dart";
import "package:http/http.dart";
import "dart:convert";
import "dart:async";

Future<ListResp<DogBreed>> allDogBreeds(String? size) async {
  Uri url = Uri.http("10.0.2.2:8000", "/api/dogs/breeds",
      size != null ? {"size": size} : null);
  final resp = await get(url);
  if (resp.statusCode != 200) {
    throw Exception(resp.body);
  }
  Map<String, dynamic> map = jsonDecode(resp.body);
  List<DogBreed> list = List<Map<String, dynamic>>.from(map["list"])
      .map((m) => DogBreed(m["id"], m["name"]))
      .toList();
  int total = map["total"];
  return ListResp(list, total);
}
