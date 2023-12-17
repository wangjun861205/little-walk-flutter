// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'walk_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalkRequestImpl _$$WalkRequestImplFromJson(Map<String, dynamic> json) =>
    _$WalkRequestImpl(
      id: json['id'] as String,
      dogs: (json['dogs'] as List<dynamic>)
          .map((e) => Dog.fromJson(e as Map<String, dynamic>))
          .toList(),
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
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

Map<String, dynamic> _$$WalkRequestImplToJson(_$WalkRequestImpl instance) =>
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

_$WalkRequestValueImpl _$$WalkRequestValueImplFromJson(
        Map<String, dynamic> json) =>
    _$WalkRequestValueImpl(
      id: json['id'] as String?,
      dogs: (json['dogs'] as List<dynamic>?)
          ?.map((e) => Dog.fromJson(e as Map<String, dynamic>))
          .toList(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$WalkRequestValueImplToJson(
        _$WalkRequestValueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dogs': instance.dogs,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
