part of 'done_work_bloc.dart';

@immutable
sealed class DoneWorkState {}

final class DoneWorkInitial extends DoneWorkState {}

class DoneWorkSuccess extends DoneWorkState {
  final List<DoneWork> doneWorks;
  DoneWorkSuccess({required this.doneWorks});
}

class DoneWorkLoading extends DoneWorkState {}

class DoneWorkFailed extends DoneWorkState {
  final CatchException e;

  DoneWorkFailed({required this.e});
}
