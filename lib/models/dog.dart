import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:little_walk/models/owner.dart';

part 'dog.freezed.dart';
part 'dog.g.dart';

@freezed
class Dog with _$Dog {
  const factory Dog({
    String? id,
    String? name,
    String? gender,
    Breed? breed,
    String? birthday,
    @JsonKey(name: "owners") List<Owner>? owners,
    @JsonKey(name: "portrait_id") String? portraitID,
  }) = _Dog;

  factory Dog.fromJson(Map<String, dynamic> json) => _$DogFromJson(json);
}

@freezed
class Breed with _$Breed {
  const factory Breed({
    String? id,
    String? category,
    String? name,
    String? photo,
  }) = _Breed;

  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);
}
