part of 'staff_bloc.dart';

@immutable
sealed class StaffEvent {}

class StaffFetch extends StaffEvent {
  final String id;

  StaffFetch({required this.id});
}
