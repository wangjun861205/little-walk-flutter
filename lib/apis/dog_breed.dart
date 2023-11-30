import "../models/dog_breed.dart";
import "./common.dart";
import "package:http/http.dart";
import "dart:convert";
import "dart:async";

Future<ListResp<DogBreed>> queryBreeds(
    String? category, Pagination page) async {
  Uri url = Uri.http(
      "10.0.2.2:8000",
      "/breeds",
      category != null
          ? {
              "category_eq": category,
              "page": page.page.toString(),
              "size": page.size.toString()
            }
          : {"page": page.page.toString(), "size": page.size.toString()});
  final resp = await get(url);
  if (resp.statusCode != 200) {
    throw Exception(resp.body);
  }
  Map<String, dynamic> map = jsonDecode(resp.body);
  List<DogBreed> list = List<Map<String, dynamic>>.from(map["list"])
      .map((m) => DogBreed.fromJson(m))
      .toList();
  int total = map["total"];
  return ListResp(list, total);
}
