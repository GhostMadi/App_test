// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part "done_work.g.dart";

@JsonSerializable()
class DoneWork {
  int? id;
  List<dynamic>? period;
  int? work;
  int? machine;
  int? equipment;
  WorkOrderListDetail? work_order;
  String? supervisor_progress_volume;
  DetailDoneWorkLinkedObject? linked_objects;
  List<DetailDoneWorkBrigade>? brigades;

  DoneWork(
      {this.period,
      this.supervisor_progress_volume,
      this.work_order,
      this.id,
      this.brigades,
      this.equipment,
      this.linked_objects,
      this.machine,
      this.work});

  factory DoneWork.fromJson(Map<String, dynamic> json) =>
      _$DoneWorkFromJson(json);

  Map<String, dynamic> toJson() => _$DoneWorkToJson(this);
}

@JsonSerializable()
class DetailDoneWorkLinkedObject {
  int? field;
  int? staff;
  int? machine;
  int? business_process;
  int? culture;
  DetailDoneWorkLinkedObject(
      {this.field,
      this.culture,
      this.business_process,
      this.machine,
      this.staff});

  factory DetailDoneWorkLinkedObject.fromJson(Map<String, dynamic> json) =>
      _$DetailDoneWorkLinkedObjectFromJson(json);
  Map<String, dynamic> toJson() => _$DetailDoneWorkLinkedObjectToJson(this);
}

enum Status {
  in_progress('in_progress'),
  canceled('canceled'),
  partially_completed('partially_completed'),
  completed('completed'),
  not_completed('canceled');

  final String localiztion;
  const Status(this.localiztion);
}

@JsonSerializable()
class WorkOrderListDetail {
  Status status;
  WorkOrderListDetail({
    required this.status,
  });

  factory WorkOrderListDetail.fromJson(Map<String, dynamic> map) =>
      _$WorkOrderListDetailFromJson(map);

  Map<String, dynamic> toJson() => _$WorkOrderListDetailToJson(this);
}

@JsonSerializable()
class DetailDoneWorkBrigade {
  int? staff;
  int? role;
  DetailDoneWorkBrigade({
    this.staff,
    this.role,
  });

  factory DetailDoneWorkBrigade.fromJson(Map<String, dynamic> json) =>
      _$DetailDoneWorkBrigadeFromJson(json);
  Map<String, dynamic> toJson() => _$DetailDoneWorkBrigadeToJson(this);
}
