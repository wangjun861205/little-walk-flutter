// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParamsImpl _$$ParamsImplFromJson(Map<String, dynamic> json) => _$ParamsImpl(
      name: json['name'] as String,
      age: json['age'] as int,
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      ids: (json['ids'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ParamsImplToJson(_$ParamsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'pagination': instance.pagination,
      'ids': instance.ids,
    };
