// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part "field.g.dart";

@JsonSerializable()
class Field {
  final int? id;
  final String? title;
  final String? fact_area;
  final String? document_area;
  final String? soil_type;
  final Map<String,dynamic>? shape_gis;

  Field(
      {this.title,
      this.shape_gis,
      this.document_area,
      this.id,
      this.soil_type,
      this.fact_area});

  factory Field.fromJson(Map<String, dynamic> map) => _$FieldFromJson(map);

  Map<String, dynamic> toJson() => _$FieldToJson(this);

  static final empty =
      Field(title: '', document_area: '', id: 0, soil_type: '', fact_area: '');
}
