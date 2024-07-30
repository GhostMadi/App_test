import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/src/core/server/exceptions.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/business_processes_logic/model/business_processes.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/business_processes_logic/repository/business_processes_repository.dart';
import 'package:meta/meta.dart';

part 'detail_business_process_event.dart';
part 'detail_business_process_state.dart';

class DetailBusinessProcessBloc
    extends Bloc<DetailBusinessProcessEvent, DetailBusinessProcessState> {
  final BusinessProcessesRepository businessProcessesRepository;
  DetailBusinessProcessBloc({required this.businessProcessesRepository})
      : super(DetailBusinessProcessInitial()) {
    on<FetchDetailBusinessProcess>(
        (event, emit) => fetchBussiness(event, emit));
  }

  Future<void> fetchBussiness(FetchDetailBusinessProcess event,
      Emitter<DetailBusinessProcessState> emit) async {
    emit(BetailBusinessProcessLoading());
    try {
      DetailBusinessProcess businessProcess = await businessProcessesRepository
          .fetchBusinessProcesses(event.idCompany, event.id);
      emit(BetailBusinessProcessSuccess(businessProcess: businessProcess));
    } catch (e) {
      emit(BetailBusinessProcessFailed(e: CatchException.defineException(e)));
    }
  }
}
