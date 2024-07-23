import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/src/core/server/exceptions.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/machines_login/model/machines.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/machines_login/repository/machines_repository.dart';
import 'package:meta/meta.dart';

part 'machines_event.dart';
part 'machines_state.dart';

class MachinesBloc extends Bloc<MachinesEvent, MachinesState> {
  final MachinesRepository machinesRepository;
  MachinesBloc({required this.machinesRepository}) : super(MachinesInitial()) {
    on<MachinessFetch>((event, emit) => fetchMachiness(event, emit));
  }

  Future<void> fetchMachiness(
      MachinessFetch event, Emitter<MachinesState> emit) async {
    emit(MachinesLoading());
    try {
      List<DetailsMachine> machinesList =
          await machinesRepository.fetchMachine(event.id);
      emit(MachinesSuccess(machinesList: machinesList));
    } catch (e) {
      emit(MachinesFailed(e: CatchException.defineException(e)));
    }
  }
}
