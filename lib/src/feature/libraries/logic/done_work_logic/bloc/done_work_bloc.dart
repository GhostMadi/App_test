import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/src/core/server/exceptions.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/model/done_work/done_work.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/repository/done_work_repository.dart';
import 'package:meta/meta.dart';

part 'done_work_event.dart';
part 'done_work_state.dart';

class DoneWorkBloc extends Bloc<DoneWorkEvent, DoneWorkState> {
  final DoneWorkRepository doneWorkRepository;
  DoneWorkBloc({required this.doneWorkRepository}) : super(DoneWorkInitial()) {
    on<DoneWorkFetch>((event, emit) => fetchDoneWork(event, emit));
  }

  Future<void> fetchDoneWork(
      DoneWorkFetch event, Emitter<DoneWorkState> emit) async {
    emit(DoneWorkLoading());
    try {
      List<DoneWork> doneWorks =
          await doneWorkRepository.fetchDoneWorks(event.id);
      emit(DoneWorkSuccess(doneWorks: doneWorks));
    } catch (e) {
      emit(DoneWorkFailed(e: CatchException.defineException(e)));
    }
  }
}
