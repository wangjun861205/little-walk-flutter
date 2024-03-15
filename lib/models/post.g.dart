// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatePostImpl _$$CreatePostImplFromJson(Map<String, dynamic> json) =>
    _$CreatePostImpl(
      text: json['text'] as String? ?? "",
      medias: (json['medias'] as List<dynamic>?)
              ?.map((e) => UploadedFile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CreatePostImplToJson(_$CreatePostImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'medias': instance.medias,
    };

_$PostMediaImpl _$$PostMediaImplFromJson(Map<String, dynamic> json) =>
    _$PostMediaImpl(
      id: json['id'] as String,
      uploadedFile:
          UploadedFile.fromJson(json['uploaded_file'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PostMediaImplToJson(_$PostMediaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uploaded_file': instance.uploadedFile,
    };

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      avatar: UploadedFile.fromJson(json['avatar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
    };

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      id: json['id'] as String,
      profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile,
    };

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: json['id'] as String,
      text: json['text'] as String,
      medias: (json['medias'] as List<dynamic>)
          .map((e) => PostMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      poster: UserInfo.fromJson(json['poster'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'medias': instance.medias,
      'poster': instance.poster,
    };
