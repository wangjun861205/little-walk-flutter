// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'walking_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalkingOfferImpl _$$WalkingOfferImplFromJson(Map<String, dynamic> json) =>
    _$WalkingOfferImpl(
      id: json['id'] as String?,
      dogs: (json['dogs'] as List<dynamic>?)
          ?.map((e) => Dog.fromJson(e as Map<String, dynamic>))
          .toList(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      acceptedBy: json['accepted_by'] as String?,
      acceptedAt: json['accepted_at'] == null
          ? null
          : DateTime.parse(json['accepted_at'] as String),
      canceledAt: json['canceled_at'] == null
          ? null
          : DateTime.parse(json['canceled_at'] as String),
      startedAt: json['started_at'] == null
          ? null
          : DateTime.parse(json['started_at'] as String),
      finishedAt: json['finished_at'] == null
          ? null
          : DateTime.parse(json['finished_at'] as String),
    );

Map<String, dynamic> _$$WalkingOfferImplToJson(_$WalkingOfferImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dogs': instance.dogs,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'accepted_by': instance.acceptedBy,
      'accepted_at': instance.acceptedAt?.toIso8601String(),
      'canceled_at': instance.canceledAt?.toIso8601String(),
      'started_at': instance.startedAt?.toIso8601String(),
      'finished_at': instance.finishedAt?.toIso8601String(),
    };

_$WalkingLocationImpl _$$WalkingLocationImplFromJson(
        Map<String, dynamic> json) =>
    _$WalkingLocationImpl(
      id: json['id'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      offer: json['offer'] == null
          ? null
          : WalkingOffer.fromJson(json['offer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WalkingLocationImplToJson(
        _$WalkingLocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'offer': instance.offer,
    };
