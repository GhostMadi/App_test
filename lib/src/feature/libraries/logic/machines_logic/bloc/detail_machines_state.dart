part of 'detail_machines_bloc.dart';

@freezed
class DetailMachinesState with _$DetailMachinesState {
  const factory DetailMachinesState.initial() = Initial;
  const factory DetailMachinesState.success({required List<DetailsMachine> listMachines}) = Success;
  const factory DetailMachinesState.failed({required CatchException error}) = Failed;

}
