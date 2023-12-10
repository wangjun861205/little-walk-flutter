import 'package:little_walk/models/dog.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'walk_request.freezed.dart';
part 'walk_request.g.dart';

@freezed
class WalkRequest with _$WalkRequest {
  const factory WalkRequest({
    required String id,
    required List<Dog> dogs,
    required double longitude,
    required double latitude,
    @JsonKey(name: "accepted_by") String? acceptedBy,
    @JsonKey(name: "accepted_at") DateTime? acceptedAt,
    @JsonKey(name: "canceled_at") DateTime? canceledAt,
    @JsonKey(name: "started_at") DateTime? startedAt,
    @JsonKey(name: "finished_at") DateTime? finishedAt,
  }) = _WalkRequest;

  factory WalkRequest.fromJson(Map<String, dynamic> json) =>
      _$WalkRequestFromJson(json);
}

@freezed
class WalkRequestValue with _$WalkRequestValue {
  const factory WalkRequestValue({
    String? id,
    @JsonKey(name: "dog_ids") List<String>? dogIDs,
    double? longitude,
    double? latitude,
  }) = _WalkRequestValue;

  factory WalkRequestValue.fromJson(Map<String, dynamic> json) =>
      _$WalkRequestValueFromJson(json);

  factory WalkRequestValue.fromWalkRequest(WalkRequest req) => WalkRequestValue(
      id: req.id,
      dogIDs: req.dogs.map((dog) => dog.id).toList(),
      longitude: req.longitude,
      latitude: req.latitude);
}
