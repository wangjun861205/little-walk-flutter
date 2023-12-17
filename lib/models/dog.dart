import 'package:little_walk/models/dog_breed.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'dog.freezed.dart';
part 'dog.g.dart';

@freezed
class Dog with _$Dog {
  const factory Dog({
    required String id,
    required String name,
    required String gender,
    required DogBreed breed,
    required String birthday,
    required List<String> tags,
    @JsonKey(name: "owner_id") required String ownerID,
    @JsonKey(name: "portrait_id") String? portraitID,
  }) = _Dog;

  factory Dog.fromJson(Map<String, dynamic> json) => _$DogFromJson(json);
}

@freezed
class DogValue with _$DogValue {
  const factory DogValue({
    String? id,
    String? name,
    String? gender,
    DogBreedValue? breed,
    String? birthday,
    List<String>? tags,
    @JsonKey(name: "portrait_id") String? portraitID,
  }) = _DogValue;

  factory DogValue.fromDog(Dog dog) => DogValue(
      id: dog.id,
      name: dog.name,
      gender: dog.gender,
      breed: DogBreedValue.fromDogBreed(dog.breed),
      birthday: dog.birthday,
      tags: dog.tags,
      portraitID: dog.portraitID);

  factory DogValue.fromJson(Map<String, dynamic> json) =>
      _$DogValueFromJson(json);
}
