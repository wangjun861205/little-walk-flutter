import 'package:little_walk/models/dog.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'walking_offer.freezed.dart';
part 'walking_offer.g.dart';

@freezed
class WalkingOffer with _$WalkingOffer {
  const factory WalkingOffer({
    String? id,
    List<Dog>? dogs,
    double? longitude,
    double? latitude,
    @JsonKey(name: "accepted_by") String? acceptedBy,
    @JsonKey(name: "accepted_at") DateTime? acceptedAt,
    @JsonKey(name: "canceled_at") DateTime? canceledAt,
    @JsonKey(name: "started_at") DateTime? startedAt,
    @JsonKey(name: "finished_at") DateTime? finishedAt,
  }) = _WalkingOffer;

  factory WalkingOffer.fromJson(Map<String, dynamic> json) =>
      _$WalkingOfferFromJson(json);
}

@freezed
class WalkingLocation with _$WalkingLocation {
  const factory WalkingLocation({
    String? id,
    double? longitude,
    double? latitude,
    WalkingOffer? offer,
  }) = _WalkingLocation;

  factory WalkingLocation.fromJson(Map<String, dynamic> json) =>
      _$WalkingLocationFromJson(json);
}
