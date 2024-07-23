part of 'done_work_bloc.dart';

@immutable
sealed class DoneWorkEvent {}

class DoneWorkFetch extends DoneWorkEvent {
  final String id;

  DoneWorkFetch({required this.id});
}
