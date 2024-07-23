// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part "done_work.g.dart";

@JsonSerializable()
class DoneWork {
  List<dynamic>? period;
  int? work;
  int? machine;
  WorkOrderListDetail? work_order;
  String? supervisor_progress_volume;
  DetailDoneWorkLinkedObject? linked_objects;
  List<DetailDoneWorkBrigade>? brigades;

  DoneWork(
      {this.period,
      this.supervisor_progress_volume,
      this.work_order,
      this.brigades,
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
  DetailDoneWorkLinkedObject({this.field, this.machine, this.staff});

  factory DetailDoneWorkLinkedObject.fromJson(Map<String, dynamic> json) =>
      _$DetailDoneWorkLinkedObjectFromJson(json);
  Map<String, dynamic> toJson() => _$DetailDoneWorkLinkedObjectToJson(this);
}

enum Status {
  in_progress,
  canceled,
  partially_completed,
  completed,
  not_completed
}

extension StatusExtension on Status {
  static Status fromString(String status) {
    switch (status) {
      case 'in_progress':
        return Status.in_progress;
      case 'canceled':
        return Status.canceled;
      case 'partially_completed':
        return Status.partially_completed;
      case 'completed':
        return Status.completed;
      case 'not_completed':
        return Status.not_completed;

      default:
        return Status.not_completed;
    }
  }

  String toJson() {
    switch (this) {
      case Status.in_progress:
        return 'in_progress';
      case Status.canceled:
        return 'canceled';
      case Status.partially_completed:
        return 'partially_completed';
      case Status.completed:
        return 'completed';
      case Status.not_completed:
        return 'not_completed';
      default:
        return 'not_completed';
    }
  }
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
