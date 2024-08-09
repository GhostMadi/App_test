// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'done_work.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoneWork _$DoneWorkFromJson(Map<String, dynamic> json) => DoneWork(
      period: json['period'] as List<dynamic>?,
      supervisor_progress_volume: json['supervisor_progress_volume'] as String?,
      work_order: json['work_order'] == null
          ? null
          : WorkOrderListDetail.fromJson(
              json['work_order'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      brigades: (json['brigades'] as List<dynamic>?)
          ?.map(
              (e) => DetailDoneWorkBrigade.fromJson(e as Map<String, dynamic>))
          .toList(),
      equipment: (json['equipment'] as num?)?.toInt(),
      linked_objects: json['linked_objects'] == null
          ? null
          : DetailDoneWorkLinkedObject.fromJson(
              json['linked_objects'] as Map<String, dynamic>),
      machine: (json['machine'] as num?)?.toInt(),
      work: (json['work'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DoneWorkToJson(DoneWork instance) => <String, dynamic>{
      'id': instance.id,
      'period': instance.period,
      'work': instance.work,
      'machine': instance.machine,
      'equipment': instance.equipment,
      'work_order': instance.work_order,
      'supervisor_progress_volume': instance.supervisor_progress_volume,
      'linked_objects': instance.linked_objects,
      'brigades': instance.brigades,
    };

DetailDoneWorkLinkedObject _$DetailDoneWorkLinkedObjectFromJson(
        Map<String, dynamic> json) =>
    DetailDoneWorkLinkedObject(
      field: (json['field'] as num?)?.toInt(),
      culture: (json['culture'] as num?)?.toInt(),
      business_process: (json['business_process'] as num?)?.toInt(),
      machine: (json['machine'] as num?)?.toInt(),
      staff: (json['staff'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DetailDoneWorkLinkedObjectToJson(
        DetailDoneWorkLinkedObject instance) =>
    <String, dynamic>{
      'field': instance.field,
      'staff': instance.staff,
      'machine': instance.machine,
      'business_process': instance.business_process,
      'culture': instance.culture,
    };

WorkOrderListDetail _$WorkOrderListDetailFromJson(Map<String, dynamic> json) =>
    WorkOrderListDetail(
      status: $enumDecode(_$StatusEnumMap, json['status']),
    );

Map<String, dynamic> _$WorkOrderListDetailToJson(
        WorkOrderListDetail instance) =>
    <String, dynamic>{
      'status': _$StatusEnumMap[instance.status]!,
    };

const _$StatusEnumMap = {
  Status.in_progress: 'in_progress',
  Status.canceled: 'canceled',
  Status.partially_completed: 'partially_completed',
  Status.completed: 'completed',
  Status.not_completed: 'not_completed',
};

DetailDoneWorkBrigade _$DetailDoneWorkBrigadeFromJson(
        Map<String, dynamic> json) =>
    DetailDoneWorkBrigade(
      staff: (json['staff'] as num?)?.toInt(),
      role: (json['role'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DetailDoneWorkBrigadeToJson(
        DetailDoneWorkBrigade instance) =>
    <String, dynamic>{
      'staff': instance.staff,
      'role': instance.role,
    };
