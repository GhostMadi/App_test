// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Field _$FieldFromJson(Map<String, dynamic> json) => Field(
      title: json['title'] as String,
      document_area: json['document_area'] as String,
      id: (json['id'] as num).toInt(),
      soil_type: json['soil_type'] as String,
      fact_area: json['fact_area'] as String,
    );

Map<String, dynamic> _$FieldToJson(Field instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'fact_area': instance.fact_area,
      'document_area': instance.document_area,
      'soil_type': instance.soil_type,
    };
