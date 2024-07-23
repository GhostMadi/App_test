import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/src/core/server/exceptions.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/works_logic/model/works_model.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/works_logic/repository/works_repository.dart';
import 'package:meta/meta.dart';

part 'works_event.dart';
part 'works_state.dart';

class WorksBloc extends Bloc<WorksEvent, WorksState> {
  final WorksRepository worksRepository;
  WorksBloc({required this.worksRepository}) : super(WorksInitial()) {
    on<WorksFetch>((event, emit) => worksListFetch(event, emit));
  }

  Future<void> worksListFetch(
      WorksFetch event, Emitter<WorksState> emit) async {
    emit(WorksLoading());
    try {
      List<Works> worksList = await worksRepository.fetchWorks(event.id);

      emit(WorksSuccess(worksList: worksList));
    } catch (e) {
      emit(WorksFailed(e: CatchException.defineException(e)));
    }
  }
}
