part of 'staff_bloc.dart';

@immutable
sealed class StaffState {}

final class StaffInitial extends StaffState {}

class StaffSuccess extends StaffState {
  final List<DetailStaff> staffList;

  StaffSuccess({required this.staffList});
}

class StaffFailed extends StaffState {
  final CatchException e;

  StaffFailed({required this.e});
}

class StaffLoading extends StaffState {}
