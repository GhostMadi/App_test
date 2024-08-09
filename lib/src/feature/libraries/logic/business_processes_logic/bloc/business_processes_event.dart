part of 'business_processes_bloc.dart';

@freezed
class BusinessProcessesEvent with _$BusinessProcessesEvent {
  const factory BusinessProcessesEvent.fetchBusProcesses({required String idCompany,required String id}) = FetchBusprocesses;
}