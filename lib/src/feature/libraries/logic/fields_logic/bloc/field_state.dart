part of 'field_bloc.dart';

@immutable
sealed class FieldState {}

final class FieldInitial extends FieldState {}

class FieldSuccess extends FieldState {
  final List<Field> listField;

  FieldSuccess({required this.listField});
}

class FieldLoading extends FieldState {}

class FieldFailed extends FieldState {
  final CatchException e;

  FieldFailed({required this.e});
}
