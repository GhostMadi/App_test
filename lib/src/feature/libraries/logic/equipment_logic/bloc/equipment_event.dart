part of 'equipment_bloc.dart';

@immutable
sealed class EquipmentEvent {}


class EquipmentFetch extends EquipmentEvent{
  final String id;
  EquipmentFetch({required this.id}); 
}