part of 'fields_bloc.dart';

@freezed
class FieldsEvent with _$FieldsEvent {
  const factory FieldsEvent.fetchFields({required String id}) = FetchFields;
}