part of 'equipments_bloc.dart';

@freezed
class EquipmentsState with _$EquipmentsState {
  const factory EquipmentsState.initial() = Initial;
  const factory EquipmentsState.success({required List<Equipment>listEquipment}) = Success;
  const factory EquipmentsState.failed({required CatchException error}) = Failed;

}
