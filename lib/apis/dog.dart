import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:little_walk/apis/common.dart';
import 'package:little_walk/models/dog_breed.dart';
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

Future<AddDogResponse> addDog(Dog dog) async {
  final resp = await httpPostJson(path: "/apis/dogs", obj: dog.toJson());
  return AddDogResponse.fromJson(resp);
}

Future<(List<Dog>, int)> myDogs(int page, size) async {
  final map = await httpGet(
      path: "/apis/dogs/mine",
      params: {"page": page.toString(), "size": size.toString()});
  final total = map["total"] as int;
  final list = map["list"] as List<dynamic>;
  final l = list.map((d) {
    final m = d as Map<String, dynamic>;
    return Dog.fromJson(m);
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

Future<List<DogBreed>> fetchBreeds({required category}) async {
  final map = await httpGet(
      path: "/apis/dogs/breeds", params: {"category_eq": category});
  final list = map["list"] as List<dynamic>;
  if (list.isEmpty) {
    return [];
  }
  return list.map((breed) {
    debugPrint("$breed");
    return DogBreed(
        id: breed["id"], category: breed["category"], name: breed["name"]);
  }).toList();
}

Future<void> updateDog(Dog dog) async {
  await httpPutJson(path: "/apis/dogs/${dog.id}", obj: dog.toJson());
}
