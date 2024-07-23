part of 'field_bloc.dart';

@immutable
sealed class FieldEvent {}

class FieldFetch extends FieldEvent {
  final String id;

  FieldFetch({required this.id});
}
