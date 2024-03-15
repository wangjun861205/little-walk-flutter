// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OwnerImpl _$$OwnerImplFromJson(Map<String, dynamic> json) => _$OwnerImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      dogs: (json['dogs'] as List<dynamic>?)
          ?.map((e) => Dog.fromJson(e as Map<String, dynamic>))
          .toList(),
      friends: (json['friends'] as List<dynamic>?)
          ?.map((e) => Owner.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OwnerImplToJson(_$OwnerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'user': instance.user,
      'dogs': instance.dogs,
      'friends': instance.friends,
    };

_$OwnershipImpl _$$OwnershipImplFromJson(Map<String, dynamic> json) =>
    _$OwnershipImpl(
      owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
      dog: Dog.fromJson(json['dog'] as Map<String, dynamic>),
      isValid: json['isValid'] as bool,
    );

Map<String, dynamic> _$$OwnershipImplToJson(_$OwnershipImpl instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'dog': instance.dog,
      'isValid': instance.isValid,
    };
