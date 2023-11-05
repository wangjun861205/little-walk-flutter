import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:little_walk/apis/common.dart';
import '../models/dog.dart';

class AddDogRequest {
  String name;
  String gender;
  String breed;
  DateTime birthday;
  bool isSterilized;
  String introduction;
  String ownerID;
  List<String> tags;
  String portraitID;

  AddDogRequest(
      this.name,
      this.gender,
      this.breed,
      this.birthday,
      this.isSterilized,
      this.introduction,
      this.ownerID,
      this.tags,
      this.portraitID);

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "gender": gender,
      "breed": breed,
      "birthday": birthday.toUtc().toIso8601String(),
      "is_sterilized": isSterilized,
      "introduction": introduction,
      "owner_id": ownerID,
      "tags": tags,
      "portrait_id": portraitID,
    };
  }
}

class AddDogResponse {
  String id;

  AddDogResponse(this.id);

  factory AddDogResponse.fromJson(Map<String, dynamic> json) {
    return AddDogResponse(json["id"]);
  }
}

Future<AddDogResponse> addDog(String authToken, AddDogRequest req) async {
  final url = Uri.parse("http://10.0.2.2:8000/dogs");
  final body = jsonEncode(req);
  final resp = await post(url,
      headers: {"X-Auth-Token": authToken, "Content-Type": "application/json"},
      body: body,
      encoding: Encoding.getByName("utf-8"));
  if (resp.statusCode != 200) {
    throw HttpException("创建失败(status code: ${resp.statusCode})");
  }
  return AddDogResponse.fromJson(jsonDecode(resp.body));
}

Future<List<Dog>> myDogs(String authToken) async {
  final url = Uri.parse("http://10.0.2.2:8000/dogs/mine");
  final resp = await get(url, headers: {"X-Auth-Token": authToken});
  if (resp.statusCode != 200) {
    throw Exception("查询我的狗狗失败: ${resp.body}");
  }
  List<Map<String, dynamic>> list = jsonDecode(resp.body);
  return list.map((m) {
    return Dog(m["name"], m["portrait"]);
  }).toList();
}
