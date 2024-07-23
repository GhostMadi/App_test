import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/src/core/server/exceptions.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/model/field.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/fields_logic/repository/field_repository.dart';
import 'package:meta/meta.dart';

part 'field_event.dart';
part 'field_state.dart';

class FieldBloc extends Bloc<FieldEvent, FieldState> {
  final FieldRepository fieldRepository;
  FieldBloc({required this.fieldRepository}) : super(FieldInitial()) {
    on<FieldFetch>((event, emit) => fieldFetch(event, emit));
  }

  Future<void> fieldFetch(FieldFetch event, Emitter<FieldState> emit) async {
    emit(FieldLoading());
    try {
      List<Field> listField = await fieldRepository.fetchField(event.id);
      emit(FieldSuccess(listField: listField));
    } catch (e) {
      emit(FieldFailed(e: CatchException.defineException(e)));
    }
  }
}
