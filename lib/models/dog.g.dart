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
          : Breed.fromJson(json['breed'] as Map<String, dynamic>),
      birthday: json['birthday'] as String?,
      owners: (json['owners'] as List<dynamic>?)
          ?.map((e) => Owner.fromJson(e as Map<String, dynamic>))
          .toList(),
      portraitID: json['portrait_id'] as String?,
    );

Map<String, dynamic> _$$DogImplToJson(_$DogImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'breed': instance.breed,
      'birthday': instance.birthday,
      'owners': instance.owners,
      'portrait_id': instance.portraitID,
    };

_$BreedImpl _$$BreedImplFromJson(Map<String, dynamic> json) => _$BreedImpl(
      id: json['id'] as String?,
      category: json['category'] as String?,
      name: json['name'] as String?,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$$BreedImplToJson(_$BreedImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'name': instance.name,
      'photo': instance.photo,
    };
