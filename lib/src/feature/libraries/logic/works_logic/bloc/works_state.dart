part of 'works_bloc.dart';

@immutable
sealed class WorksState {}

final class WorksInitial extends WorksState {}

class WorksSuccess extends WorksState {
  final List<Works> worksList;

  WorksSuccess({required this.worksList});
}

class WorksLoading extends WorksState {}

class WorksFailed extends WorksState {
  final CatchException e;
  WorksFailed({required this.e});
}
