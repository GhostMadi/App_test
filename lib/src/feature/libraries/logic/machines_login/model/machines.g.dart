// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machines.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsMachine _$DetailsMachineFromJson(Map<String, dynamic> json) =>
    DetailsMachine(
      width: json['width'] as String?,
      id: (json['id'] as num?)?.toInt(),
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      icon: json['icon'] as String?,
      machine_type: $enumDecode(_$MachineTypeEnumMap, json['machine_type']),
      household_number: json['household_number'] as String?,
      registration_number: json['registration_number'] as String?,
      vin_number: json['vin_number'] as String?,
      inventory_number: json['inventory_number'] as String?,
    );

Map<String, dynamic> _$DetailsMachineToJson(DetailsMachine instance) =>
    <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'brand': instance.brand,
      'model': instance.model,
      'household_number': instance.household_number,
      'registration_number': instance.registration_number,
      'vin_number': instance.vin_number,
      'inventory_number': instance.inventory_number,
      'width': instance.width,
      'machine_type': _$MachineTypeEnumMap[instance.machine_type]!,
    };

const _$MachineTypeEnumMap = {
  MachineType.unknown: 'unknown',
  MachineType.tractor: 'tractor',
  MachineType.truck: 'truck',
  MachineType.harvester: 'harvester',
  MachineType.sprayer: 'sprayer',
  MachineType.loader: 'loader',
  MachineType.auto: 'auto',
  MachineType.bus: 'bus',
  MachineType.plane: 'plane',
  MachineType.drone: 'drone',
  MachineType.ship: 'ship',
  MachineType.rain_machine: 'rain_machine',
  MachineType.excavator: 'excavator',
  MachineType.grader: 'grader',
  MachineType.truck_crane: 'truck_crane',
  MachineType.tanker_truck: 'tanker_truck',
  MachineType.waste_dispenser: 'waste_dispenser',
  MachineType.gasoline_tanker: 'gasoline_tanker',
  MachineType.bulldozer: 'bulldozer',
  MachineType.water_carrier: 'water_carrier',
  MachineType.grapple: 'grapple',
  MachineType.crawler_tractor: 'crawler_tractor',
  MachineType.compressor: 'compressor',
  MachineType.chemistry_machine: 'chemistry_machine',
  MachineType.minibus: 'minibus',
  MachineType.miniloader: 'miniloader',
  MachineType.fire_engine: 'fire_engine',
  MachineType.self_propelled_header: 'self_propelled_header',
};
