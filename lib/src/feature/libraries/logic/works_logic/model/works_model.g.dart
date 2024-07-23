// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'works_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Works _$WorksFromJson(Map<String, dynamic> json) => Works(
      id: (json['id'] as num?)?.toInt(),
      work_type: $enumDecodeNullable(_$WorkTypeEnumMap, json['work_type']),
      name: json['name'] as String?,
      category: (json['category'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WorksToJson(Works instance) => <String, dynamic>{
      'id': instance.id,
      'work_type': _$WorkTypeEnumMap[instance.work_type],
      'name': instance.name,
      'category': instance.category,
    };

const _$WorkTypeEnumMap = {
  WorkType.field: 'field',
  WorkType.logistic: 'logistic',
  WorkType.hand_made: 'hand_made',
  WorkType.security: 'security',
  WorkType.office: 'office',
  WorkType.repair: 'repair',
  WorkType.control: 'control',
};
