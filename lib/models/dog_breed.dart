import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'dog_breed.freezed.dart';
part 'dog_breed.g.dart';

@freezed
class DogBreed with _$DogBreed {
  const factory DogBreed({String? id, String? category, String? name}) =
      _DogBreed;

  factory DogBreed.fromJson(Map<String, dynamic> json) =>
      _$DogBreedFromJson(json);
}
