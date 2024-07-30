// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Equipment _$EquipmentFromJson(Map<String, dynamic> json) => Equipment(
      id: (json['id'] as num?)?.toInt(),
      brand: json['brand'] as String?,
      icon: json['icon'] as String?,
      model: json['model'] as String?,
      to_legal_entity: (json['to_legal_entity'] as num?)?.toInt(),
      official_number: json['official_number'] as String?,
      inner_number: json['inner_number'] as String?,
      vin_number: json['vin_number'] as String?,
      width: json['width'] as String?,
      aggregate_type:
          $enumDecodeNullable(_$AggregateTypeEnumMap, json['aggregate_type']),
    );

Map<String, dynamic> _$EquipmentToJson(Equipment instance) => <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'icon': instance.icon,
      'model': instance.model,
      'to_legal_entity': instance.to_legal_entity,
      'official_number': instance.official_number,
      'inner_number': instance.inner_number,
      'vin_number': instance.vin_number,
      'width': instance.width,
      'aggregate_type': _$AggregateTypeEnumMap[instance.aggregate_type],
    };

const _$AggregateTypeEnumMap = {
  AggregateType.unknown: 'unknown',
  AggregateType.fertilizer_spreader: 'fertilizer_spreader',
  AggregateType.weeder: 'weeder',
  AggregateType.windrower: 'windrower',
  AggregateType.tedder: 'tedder',
  AggregateType.deep_loosener: 'deep_loosener',
  AggregateType.wagon: 'wagon',
  AggregateType.header: 'header',
  AggregateType.shredder: 'shredder',
  AggregateType.roller: 'roller',
  AggregateType.kompaktomat: 'kompaktomat',
  AggregateType.belt: 'belt',
  AggregateType.mower: 'mower',
  AggregateType.cultivator: 'cultivator',
  AggregateType.disc_harrow: 'disc_harrow',
  AggregateType.sprayer: 'sprayer',
  AggregateType.loader: 'loader',
  AggregateType.leveler: 'leveler',
  AggregateType.auger_wagon: 'auger_wagon',
  AggregateType.plow: 'plow',
  AggregateType.baler: 'baler',
  AggregateType.harvester: 'harvester',
  AggregateType.chamber_treater: 'chamber_treater',
  AggregateType.rapeseed_table: 'rapeseed_table',
  AggregateType.tipper: 'tipper',
  AggregateType.sowing_machine: 'sowing_machine',
  AggregateType.animal_transport: 'animal_transport',
  AggregateType.mixer_distributor: 'mixer_distributor',
  AggregateType.header_trailer: 'header_trailer',
  AggregateType.low_loader: 'low_loader',
  AggregateType.tank: 'tank',
  AggregateType.grapple: 'grapple',
  AggregateType.comb_former: 'comb_former',
};
