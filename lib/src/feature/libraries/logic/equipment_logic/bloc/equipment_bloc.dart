import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/src/core/server/exceptions.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/equipment_logic/model/equipment.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/equipment_logic/repository/equipment_repository.dart';
import 'package:meta/meta.dart';

part 'equipment_event.dart';
part 'equipment_state.dart';

class EquipmentBloc extends Bloc<EquipmentEvent, EquipmentState> {
  final EquipmentRepository equipmentRepository;
  EquipmentBloc({required this.equipmentRepository}) : super(EquipmentInitial()) {
    on<EquipmentFetch>((event, emit) =>fetchEquipments(event, emit));
  }

  Future<void> fetchEquipments(EquipmentFetch event,Emitter<EquipmentState> emit)async{
    emit(EquipmentLoading());
    try {
      List<Equipment> eqipments = await equipmentRepository.fetchEquipment(event.id);
    emit(EquipmentSuccess(eqipments: eqipments));
      
    } catch (e) {
    emit(EquipmentFailed(e: CatchException.defineException(e)));
      
    }
  }
}
