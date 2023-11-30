// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DogImpl _$$DogImplFromJson(Map<String, dynamic> json) => _$DogImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      breed: json['breed'] == null
          ? null
          : DogBreed.fromJson(json['breed'] as Map<String, dynamic>),
      portraitID: json['portraitID'] as String?,
    );

Map<String, dynamic> _$$DogImplToJson(_$DogImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'breed': instance.breed,
      'portraitID': instance.portraitID,
    };
