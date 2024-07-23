part of 'works_bloc.dart';

@immutable
sealed class WorksEvent {}

class WorksFetch extends WorksEvent {
  final String id;

  WorksFetch({required this.id});
}
