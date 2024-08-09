// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part "map.freezed.dart";
part "map.g.dart";

@freezed
class DetailMap with _$DetailMap {
  factory DetailMap(
      {int? id,
      Map<String, dynamic>? shape_gis,
      int? culture,
      String? fact_area}) = _Detailmap;
  factory DetailMap.fromJson(Map<String, dynamic> json) =>
      _$DetailMapFromJson(json);
}
