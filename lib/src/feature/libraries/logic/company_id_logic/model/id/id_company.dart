import 'package:json_annotation/json_annotation.dart';

part "id_company.g.dart";

@JsonSerializable()
class IdCompany {
  final int id;

  IdCompany({required this.id});

  factory IdCompany.fromJson(Map<String, dynamic> json) =>
      _$IdCompanyFromJson(json);
  Map<String, dynamic> toJson() => _$IdCompanyToJson(this);
}
