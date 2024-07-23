// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'works_model.g.dart';

enum WorkType { field, logistic, hand_made, security, office, repair, control }

extension StatusExtension on WorkType {
  static WorkType fromString(String status) {
    switch (status) {
      case 'field':
        return WorkType.field;
      case 'logistic':
        return WorkType.field;
      case 'hand_made':
        return WorkType.hand_made;
      case 'security':
        return WorkType.security;
      case 'office':
        return WorkType.office;
      case 'repair':
        return WorkType.repair;
      case 'control':
        return WorkType.control;
      default:
        return WorkType.field;
    }
  }

  String toJson() {
    switch (this) {
      case WorkType.control:
        return 'control';
      case WorkType.field:
        return 'field';
      case WorkType.hand_made:
        return 'hand_made';
      case WorkType.logistic:
        return 'logistic';
      case WorkType.office:
        return 'office';
      case WorkType.repair:
        return 'repair';
      case WorkType.security:
        return 'security';
      default:
        return '';
    }
  }
}

@JsonSerializable()
class Works {
  int? id;
  WorkType? work_type;
  String? name;
  int? category;

  Works({
    this.id,
    this.work_type,
    this.name,
    this.category,
  });

  factory Works.fromJson(Map<String, dynamic> json) => _$WorksFromJson(json);

  Map<String, dynamic> toJson() => _$WorksToJson(this);
}
