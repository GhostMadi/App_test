part of 'business_processes_bloc.dart';

@freezed
class BusinessProcessesState with _$BusinessProcessesState {
  const factory BusinessProcessesState.initial() = Initial;
  const factory BusinessProcessesState.success({required DetailBusinessProcess detailBusinessProcess}) = Success;
  const factory BusinessProcessesState.failed({required CatchException error}) = Error;

}
