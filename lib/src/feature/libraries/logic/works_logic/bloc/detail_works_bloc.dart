import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/src/core/server/exceptions.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/works_logic/model/works_model.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/works_logic/repository/works_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_works_event.dart';
part 'detail_works_state.dart';
part 'detail_works_bloc.freezed.dart';

class DetailWorksBloc extends Bloc<DetailWorksEvent, DetailWorksState> {
  final WorksRepository worksRepository;
  DetailWorksBloc({required this.worksRepository}) : super(const DetailWorksState.initial()) {
    on<DetailWorksEvent>((event, emit) =>event.map(fetchWorks: (event)=>fetchDetailWorks(event, emit)));
  }


  Future<void> fetchDetailWorks(FetchWorks event,Emitter<DetailWorksState> emit)async{
    try {
      List<Works> listWorks = await worksRepository.fetchWorks(event.id);
      emit(DetailWorksState.success(listWorks: listWorks));
    } catch (e) {
      emit(DetailWorksState.failed(error: CatchException.defineException(e)));
    }
  }
}
