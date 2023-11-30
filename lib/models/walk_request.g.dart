// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'walk_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalkRequestImpl _$$WalkRequestImplFromJson(Map<String, dynamic> json) =>
    _$WalkRequestImpl(
      id: json['id'] as String?,
      dogs: (json['dogs'] as List<dynamic>?)
          ?.map((e) => Dog.fromJson(e as Map<String, dynamic>))
          .toList(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      acceptedBy: json['acceptedBy'] as String?,
      acceptedAt: json['acceptedAt'] == null
          ? null
          : DateTime.parse(json['acceptedAt'] as String),
      canceledAt: json['canceledAt'] == null
          ? null
          : DateTime.parse(json['canceledAt'] as String),
    );

Map<String, dynamic> _$$WalkRequestImplToJson(_$WalkRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dogs': instance.dogs,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'acceptedBy': instance.acceptedBy,
      'acceptedAt': instance.acceptedAt?.toIso8601String(),
      'canceledAt': instance.canceledAt?.toIso8601String(),
    };
