part of 'equipment_bloc.dart';

@immutable
sealed class EquipmentState {}

final class EquipmentInitial extends EquipmentState {}


class EquipmentSuccess extends EquipmentState{
  final List<Equipment>eqipments;
  EquipmentSuccess({required this.eqipments});
}
class EquipmentLoading extends EquipmentState{}
class EquipmentFailed extends EquipmentState{
  final CatchException e;
  EquipmentFailed({required this.e});
}
