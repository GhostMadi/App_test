part of 'detail_machines_bloc.dart';

@freezed
class DetailMachinesEvent with _$DetailMachinesEvent {
  const factory DetailMachinesEvent.fetchMachines({required String id}) = FetchMachines;
}