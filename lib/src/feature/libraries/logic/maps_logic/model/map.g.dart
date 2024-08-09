// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailmapImpl _$$DetailmapImplFromJson(Map<String, dynamic> json) =>
    _$DetailmapImpl(
      id: (json['id'] as num?)?.toInt(),
      shape_gis: json['shape_gis'] as Map<String, dynamic>?,
      culture: (json['culture'] as num?)?.toInt(),
      fact_area: json['fact_area'] as String?,
    );

Map<String, dynamic> _$$DetailmapImplToJson(_$DetailmapImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shape_gis': instance.shape_gis,
      'culture': instance.culture,
      'fact_area': instance.fact_area,
    };
