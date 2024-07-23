part of 'machines_bloc.dart';

@immutable
sealed class MachinesEvent {}

class MachinessFetch extends MachinesEvent {
  final String id;
  MachinessFetch({required this.id});
}
