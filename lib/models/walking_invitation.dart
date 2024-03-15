import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_walk/models/dog.dart';
import 'package:little_walk/models/owner.dart';
part 'walking_invitation.freezed.dart';
part 'walking_invitation.g.dart';

@freezed
class WalkingInvitation with _$WalkingInvitation {
  const factory WalkingInvitation({
    required String id,
    required double longitude,
    required double latitude,
    required DateTime estimatedStartTime,
    required List<Dog> dogs,
    required Owner initiator,
  }) = _WalkingInvitation;

  factory WalkingInvitation.fromJson(Map<String, dynamic> json) =>
      _$WalkingInvitationFromJson(json);
}

@freezed
class CreateWalkingInvitation with _$CreateWalkingInvitation {
  const factory CreateWalkingInvitation({
    double? longitude,
    double? latitude,
    DateTime? estimatedStartTime,
    List<Dog>? dogs,
  }) = _CreateWalkingInvitation;

  factory CreateWalkingInvitation.fromJson(Map<String, dynamic> json) =>
      _$CreateWalkingInvitationFromJson(json);
}
