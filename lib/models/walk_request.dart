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
class CreateWalkRequest with _$CreateWalkRequest {
  const factory CreateWalkRequest({
    String? id,
    List<Dog>? dogs,
    double? longitude,
    double? latitude,
  }) = _WalkRequestValue;

  factory CreateWalkRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateWalkRequestFromJson(json);

  factory CreateWalkRequest.fromWalkRequest(WalkRequest req) =>
      CreateWalkRequest(
          id: req.id,
          dogs: req.dogs,
          longitude: req.longitude,
          latitude: req.latitude);
}
