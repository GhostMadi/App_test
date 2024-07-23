part of 'machines_bloc.dart';

@immutable
sealed class MachinesState {}

final class MachinesInitial extends MachinesState {}

class MachinesSuccess extends MachinesState {
  final List<DetailsMachine> machinesList;

  MachinesSuccess({required this.machinesList});
}

class MachinesLoading extends MachinesState {}

class MachinesFailed extends MachinesState {
  final CatchException e;

  MachinesFailed({required this.e});
}
