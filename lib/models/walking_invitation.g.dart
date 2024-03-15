// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'walking_invitation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalkingInvitationImpl _$$WalkingInvitationImplFromJson(
        Map<String, dynamic> json) =>
    _$WalkingInvitationImpl(
      id: json['id'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      estimatedStartTime: DateTime.parse(json['estimatedStartTime'] as String),
      dogs: (json['dogs'] as List<dynamic>)
          .map((e) => Dog.fromJson(e as Map<String, dynamic>))
          .toList(),
      initiator: Owner.fromJson(json['initiator'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WalkingInvitationImplToJson(
        _$WalkingInvitationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'estimatedStartTime': instance.estimatedStartTime.toIso8601String(),
      'dogs': instance.dogs,
      'initiator': instance.initiator,
    };

_$CreateWalkingInvitationImpl _$$CreateWalkingInvitationImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateWalkingInvitationImpl(
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      estimatedStartTime: json['estimatedStartTime'] == null
          ? null
          : DateTime.parse(json['estimatedStartTime'] as String),
      dogs: (json['dogs'] as List<dynamic>?)
          ?.map((e) => Dog.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CreateWalkingInvitationImplToJson(
        _$CreateWalkingInvitationImpl instance) =>
    <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'estimatedStartTime': instance.estimatedStartTime?.toIso8601String(),
      'dogs': instance.dogs,
    };
