// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DogImpl _$$DogImplFromJson(Map<String, dynamic> json) => _$DogImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      gender: json['gender'] as String,
      breed: DogBreed.fromJson(json['breed'] as Map<String, dynamic>),
      birthday: json['birthday'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      ownerID: json['owner_id'] as String,
      portraitID: json['portrait_id'] as String?,
    );

Map<String, dynamic> _$$DogImplToJson(_$DogImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'breed': instance.breed,
      'birthday': instance.birthday,
      'tags': instance.tags,
      'owner_id': instance.ownerID,
      'portrait_id': instance.portraitID,
    };

_$DogValueImpl _$$DogValueImplFromJson(Map<String, dynamic> json) =>
    _$DogValueImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      breed: json['breed'] == null
          ? null
          : DogBreedValue.fromJson(json['breed'] as Map<String, dynamic>),
      birthday: json['birthday'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      portraitID: json['portrait_id'] as String?,
    );

Map<String, dynamic> _$$DogValueImplToJson(_$DogValueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'breed': instance.breed,
      'birthday': instance.birthday,
      'tags': instance.tags,
      'portrait_id': instance.portraitID,
    };
