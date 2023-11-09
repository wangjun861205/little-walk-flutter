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

Future<(List<Dog>, int)> myDogs(String authToken, int page, size) async {
  final url =
      Uri.parse("http://10.0.2.2:8000/apis/dogs/mine?page=$page&size=$size");
  final resp = await get(url, headers: {"X-Auth-Token": authToken});
  if (resp.statusCode != 200) {
    throw Exception("查询我的狗狗失败: ${resp.body}");
  }
  Map<String, dynamic> map = jsonDecode(resp.body);
  final total = map["total"] as int;
  final list = map["list"] as List<dynamic>;
  final l = list.map((d) {
    final m = d as Map<String, dynamic>;
    return Dog.fromJSON(m);
  }).toList();
  return (l, total);
}

Future<void> updateDogPortrait(
    String backendAddress, authToken, dogID, portraitID) async {
  final url = Uri.http(backendAddress, "/apis/dogs/$dogID/portrait");
  final resp = await put(url,
      headers: {"X-Auth-Token": authToken, "Content-Type": "application/json"},
      body: jsonEncode({"portrait_id": portraitID}));
  if (resp.statusCode != 200) {
    throw Exception("更新狗狗头像失败(status: ${resp.statusCode})");
  }
}
