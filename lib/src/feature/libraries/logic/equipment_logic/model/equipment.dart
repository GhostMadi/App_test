// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part "equipment.g.dart";
enum AggregateType {
  unknown('неизвестный'),
  fertilizer_spreader('разбрасыватель удобрений'),
  weeder('сорнякоуборщик'),
  windrower('валкообразователь'),
  tedder('ворошилка'),
  deep_loosener('глубокорыхлитель'),
  wagon('тележка'),
  header('жатка'),
  shredder('измельчитель'),
  roller('каток'),
  kompaktomat('компактомат'),
  belt('транспортер'),
  mower('косилка'),
  cultivator('культиватор'),
  disc_harrow('дисковая борона'),
  sprayer('опрыскиватель'),
  loader('погрузчик'),
  leveler('выравниватель'),
  auger_wagon('шнековый прицеп'),
  plow('плуг'),
  baler('пресс-подборщик'),
  harvester('комбайн'),
  chamber_treater('камера обработки'),
  rapeseed_table('стол для рапса'),
  tipper('самосвал'),
  sowing_machine('посевной агрегат'),
  animal_transport('транспорт для животных'),
  mixer_distributor('миксер-раздатчик'),
  header_trailer('прицеп для жатки'),
  low_loader('низкорамный прицеп'),
  tank('цистерна'),
  grapple('грейфер'),
  comb_former('гребнеобразователь');

  final String initializer;
  const AggregateType(this.initializer);
}


@JsonSerializable()
class Equipment {
  int? id;
  String? brand;
  String? icon;
  String? model;
  int? to_legal_entity;
  String? official_number;
  String? inner_number;
  String? vin_number;
  String? width;
  AggregateType? aggregate_type;
  Equipment({
    required this.id,
    required this.brand,
    required this.icon,
    required this.model,
    required this.to_legal_entity,
    required this.official_number,
    required this.inner_number,
    required this.vin_number,
    required this.width,
    required this.aggregate_type,
  });

  factory Equipment.fromJson(Map<String,dynamic>json)=>_$EquipmentFromJson(json);

  Map<String,dynamic> toJson()=>_$EquipmentToJson(this);

  static final empty = Equipment(id: 0, brand: '', icon: '', model: '', to_legal_entity: 0, official_number: '', inner_number: '', vin_number: '', width: '', aggregate_type: AggregateType.unknown);
}
