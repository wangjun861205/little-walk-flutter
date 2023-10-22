import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class AddDogRequest {
  String name;
  DateTime birthday;
  String breed;
  List<String> tags;
  String gender;
  String portrait;

  AddDogRequest(this.name, this.birthday, this.breed, this.tags, this.gender,
      this.portrait);
}

class AddDogResponse {
  int id;

  AddDogResponse(this.id);

  factory AddDogResponse.fromJSON(Map<String, dynamic> json) {
    final id = int.parse(json["id"] as String);
    return AddDogResponse(id);
  }
}

Future<AddDogResponse> addDog(String authToken, AddDogRequest req) async {
  final url = Uri.parse("/dogs");
  final body = jsonEncode(req);
  final resp = await post(url,
      headers: {"X-Auth-Token": authToken},
      body: body,
      encoding: Encoding.getByName("utf-8"));
  if (resp.statusCode != 200) {
    throw HttpException("创建失败(status code: ${resp.statusCode})");
  }
  return jsonDecode(resp.body);
}
