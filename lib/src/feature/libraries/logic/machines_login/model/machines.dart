// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part "machines.g.dart";

enum MachineType {
  unknown('unknown'),
  tractor('трактор'),
  truck('трак'),
  harvester('комбайн'),
  sprayer('распылитель'),
  loader('погрузчик'),
  auto('авто'),
  bus('автобус'),
  plane('самолет'),
  drone('дрон'),
  ship('корабль'),
  rain_machine('дождь машина'),
  excavator('экскаватор'),
  grader('грейдер'),
  truck_crane('грузовик кран'),
  tanker_truck('Бензовоз'),
  waste_dispenser('диспенсер отходов'),
  gasoline_tanker('бензин танкер'),
  bulldozer('бульдозер'),
  water_carrier('вода перевозчик'),
  grapple('бороться'),
  crawler_tractor('гусеничный трактор'),
  compressor('компрессор'),
  chemistry_machine('химия машина'),
  minibus('микроавтобус'),
  miniloader('минипогрузчик'),
  fire_engine('пожарная машина'),
  self_propelled_header('самоходный жатка');

  final String localiztion;
  const MachineType(this.localiztion);
}

@JsonSerializable()
class DetailsMachine {
  int? id;
  String? household_number;
  String? registration_number;
  String? vin_number;
  String? inventory_number;
  String? width;
  final MachineType machine_type;
  DetailsMachine({
    required this.width,
    required this.id,
    required this.machine_type,
    required this.household_number,
    required this.registration_number,
    required this.vin_number,
    required this.inventory_number,
  });
  factory DetailsMachine.fromJson(Map<String, dynamic> json) =>
      _$DetailsMachineFromJson(json);
  Map<String, dynamic> toJson() => _$DetailsMachineToJson(this);

  static final empty = DetailsMachine(
      width: '',
      id: 0,
      machine_type: MachineType.unknown,
      household_number: '',
      registration_number: '',
      vin_number: '',
      inventory_number: '');
}
