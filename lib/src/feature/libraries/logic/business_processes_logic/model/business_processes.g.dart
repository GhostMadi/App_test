// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_processes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailBusinessProcess _$DetailBusinessProcessFromJson(
        Map<String, dynamic> json) =>
    DetailBusinessProcess(
      id: (json['id'] as num?)?.toInt(),
      linked_object: json['linked_object'] == null
          ? null
          : DetailsProcessLinkedObject.fromJson(
              json['linked_object'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailBusinessProcessToJson(
        DetailBusinessProcess instance) =>
    <String, dynamic>{
      'id': instance.id,
      'linked_object': instance.linked_object,
    };

DetailsProcessLinkedObject _$DetailsProcessLinkedObjectFromJson(
        Map<String, dynamic> json) =>
    DetailsProcessLinkedObject(
      id: (json['id'] as num?)?.toInt(),
      culture: (json['culture'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DetailsProcessLinkedObjectToJson(
        DetailsProcessLinkedObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'culture': instance.culture,
    };
