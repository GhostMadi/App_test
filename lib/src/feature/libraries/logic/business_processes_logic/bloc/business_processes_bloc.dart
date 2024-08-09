import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/src/core/server/exceptions.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/business_processes_logic/model/business_processes.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/business_processes_logic/repository/business_processes_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_processes_event.dart';
part 'business_processes_state.dart';
part 'business_processes_bloc.freezed.dart';

class BusinessProcessesBloc extends Bloc<BusinessProcessesEvent, BusinessProcessesState> {
  final BusinessProcessesRepository businessProcessesRepository;
  BusinessProcessesBloc({required this.businessProcessesRepository}) : super(const BusinessProcessesState.initial()) {
    on<BusinessProcessesEvent>((event, emit) =>event.map(fetchBusProcesses: (event)=>fetchBusProccess(event, emit)));
  }

  Future<void> fetchBusProccess(FetchBusprocesses event ,Emitter<BusinessProcessesState> emit )async{
    try {
      DetailBusinessProcess detailBusinessProcess = await businessProcessesRepository.fetchBusinessProcesses(event.idCompany,event.id);
      emit(BusinessProcessesState.success(detailBusinessProcess: detailBusinessProcess));
    } catch (e) {
      emit(BusinessProcessesState.failed(error: CatchException.defineException(e)));
    }
  }
}
