part of 'equipments_bloc.dart';

@freezed
class EquipmentsEvent with _$EquipmentsEvent {
  const factory EquipmentsEvent.fetchEquipment({required String id}) = FetchEquipment;
}