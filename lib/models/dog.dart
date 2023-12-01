import 'package:little_walk/models/dog_breed.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'dog.freezed.dart';
part 'dog.g.dart';

@freezed
class Dog with _$Dog {
  const factory Dog({
    String? id,
    String? name,
    String? gender,
    DogBreed? breed,
    @JsonKey(name: "portrait_id") String? portraitID,
  }) = _Dog;

  factory Dog.fromJson(Map<String, dynamic> json) => _$DogFromJson(json);
}
