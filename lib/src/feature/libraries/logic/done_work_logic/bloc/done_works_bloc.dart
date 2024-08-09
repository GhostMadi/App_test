import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/src/core/server/exceptions.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/model/done_work/done_work.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/done_work_logic/repository/done_work_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'done_works_event.dart';
part 'done_works_state.dart';
part 'done_works_bloc.freezed.dart';

class DoneWorksBloc extends Bloc<DoneWorksEvent, DoneWorksState> {
  final DoneWorkRepository doneWorkRepository;
  DoneWorksBloc({required this.doneWorkRepository}) : super(const DoneWorksState.initial()) {
    on<DoneWorksEvent>((event, emit) =>event.map(fetchDoneWorks: (event)=>fetchDoneWorkList(event, emit)));
  }

  Future<void> fetchDoneWorkList(FetchDoneWorks event ,Emitter<DoneWorksState> emit)async{
    try {
      List<DoneWork> doneWorkLists = await doneWorkRepository.fetchDoneWorks(event.id);
      emit(DoneWorksState.success(listDoneWorks: doneWorkLists));
    } catch (e) {
      emit(DoneWorksState.failed(error: CatchException.defineException(e)));
    }
  }
}
