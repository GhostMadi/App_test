import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/src/core/server/exceptions.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/machines_logic/model/machines.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/machines_logic/repository/machines_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_machines_event.dart';
part 'detail_machines_state.dart';
part 'detail_machines_bloc.freezed.dart';

class DetailMachinesBloc extends Bloc<DetailMachinesEvent, DetailMachinesState> {
  final MachinesRepository machinesRepository;
  DetailMachinesBloc({required this.machinesRepository}) : super(const DetailMachinesState.initial()) {
    on<DetailMachinesEvent>((event, emit) =>event.map(fetchMachines: (event)=>fetchListMachines(event, emit)));
  }

  Future<void> fetchListMachines(FetchMachines event,Emitter<DetailMachinesState> emit)async{
    try {
      List<DetailsMachine> listMachines = await machinesRepository.fetchMachine(event.id);
      emit(DetailMachinesState.success(listMachines: listMachines));
    } catch (e) {
      emit(DetailMachinesState.failed(error: CatchException.defineException(e)));
    }
  }
}
