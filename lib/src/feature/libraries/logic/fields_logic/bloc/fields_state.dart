part of 'fields_bloc.dart';

@freezed
class FieldsState with _$FieldsState {
  const factory FieldsState.initial() = Initial;
  const factory FieldsState.success({required List<Field> listFileds}) = Success;
  const factory FieldsState.failed({required CatchException error}) = Failed;


}
