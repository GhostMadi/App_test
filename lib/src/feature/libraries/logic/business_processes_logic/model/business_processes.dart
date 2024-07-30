// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part "business_processes.g.dart";

@JsonSerializable()
class DetailBusinessProcess {
  int? id;
  DetailsProcessLinkedObject? linked_object;

  DetailBusinessProcess({required this.id, required this.linked_object});

  factory DetailBusinessProcess.fromJson(Map<String, dynamic> json) =>
      _$DetailBusinessProcessFromJson(json);
  Map<String, dynamic> toJson() => _$DetailBusinessProcessToJson(this);
  static  final empty = DetailBusinessProcess(id: 0, linked_object: null);
}


@JsonSerializable()
class DetailsProcessLinkedObject {
  int? id;
  int? culture;
  DetailsProcessLinkedObject({required this.id, required this.culture});

  factory DetailsProcessLinkedObject.fromJson(Map<String, dynamic> json) =>
      _$DetailsProcessLinkedObjectFromJson(json);
  Map<String, dynamic> toJson() => _$DetailsProcessLinkedObjectToJson(this);


  
}
