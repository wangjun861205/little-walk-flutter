import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'dog_breed.freezed.dart';
part 'dog_breed.g.dart';

@freezed
class DogBreed with _$DogBreed {
  const factory DogBreed(
      {required String id,
      required String category,
      required String name}) = _DogBreed;

  factory DogBreed.fromJson(Map<String, dynamic> json) =>
      _$DogBreedFromJson(json);
}
