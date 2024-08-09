import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/src/core/server/exceptions.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/model/field.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/repository/field_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fields_event.dart';
part 'fields_state.dart';
part 'fields_bloc.freezed.dart';

class FieldsBloc extends Bloc<FieldsEvent, FieldsState> {
  final FieldRepository fieldRepository;
  FieldsBloc({required this.fieldRepository})
      : super(const FieldsState.initial()) {
    on<FieldsEvent>((event, emit) =>
        event.map(fetchFields: (event) => fetchFiledList(event, emit)));
  }

  Future<void> fetchFiledList(
      FetchFields event, Emitter<FieldsState> emit) async {
    try {
      List<Field> listField = await fieldRepository.fetchField(event.id);
      emit(FieldsState.success(listFileds: listField));
    } catch (e) {
      emit(FieldsState.failed(error: CatchException.defineException(e)));
    }
  }
}
