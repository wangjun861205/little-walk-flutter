import 'package:little_walk/models/dog.dart';
import 'package:little_walk/models/auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'owner.freezed.dart';
part 'owner.g.dart';

@freezed
class Owner with _$Owner {
  const factory Owner({
    String? id,
    String? name,
    String? avatar,
    User? user,
    List<Dog>? dogs,
    List<Owner>? friends,
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}

@freezed
class Ownership with _$Ownership {
  const factory Ownership({
    required Owner owner,
    required Dog dog,
    required bool isValid,
  }) = _Ownership;

  factory Ownership.fromJson(Map<String, dynamic> json) =>
      _$OwnershipFromJson(json);
}
