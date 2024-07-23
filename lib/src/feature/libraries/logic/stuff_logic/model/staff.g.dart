// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailStaff _$DetailStaffFromJson(Map<String, dynamic> json) => DetailStaff(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      position: json['position'] as String,
    );

Map<String, dynamic> _$DetailStaffToJson(DetailStaff instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'position': instance.position,
    };
