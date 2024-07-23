// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
part "staff.g.dart";

@JsonSerializable()
class DetailStaff {
  final int id;
  final String name;
  final String position;
  DetailStaff({
    required this.id,
    required this.name,
    required this.position,
  });
  factory DetailStaff.fromJson(Map<String, dynamic> json) =>
      _$DetailStaffFromJson(json);
  Map<String, dynamic> toJson() => _$DetailStaffToJson(this);

  static final empty = DetailStaff(id: 0, name: '', position: '');
}
