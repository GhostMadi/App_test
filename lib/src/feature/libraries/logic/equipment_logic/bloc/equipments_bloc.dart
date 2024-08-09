import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/src/core/server/exceptions.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/equipment_logic/model/equipment.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/equipment_logic/repository/equipment_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'equipments_event.dart';
part 'equipments_state.dart';
part 'equipments_bloc.freezed.dart';

class EquipmentsBloc extends Bloc<EquipmentsEvent, EquipmentsState> {
  final EquipmentRepository equipmentRepository;
  EquipmentsBloc({required this.equipmentRepository}) : super(const EquipmentsState.initial()) {
    on<EquipmentsEvent>((event, emit)=>event.map(fetchEquipment: (event)=>fetchEquipmentList(event, emit)));
  }

  Future<void> fetchEquipmentList(FetchEquipment event,Emitter<EquipmentsState> emit)async{
    try {
      List<Equipment> listEquipment = await equipmentRepository.fetchEquipment(event.id);
      emit(EquipmentsState.success(listEquipment: listEquipment));
    } catch (e) {
      emit(EquipmentsState.failed(error: CatchException.defineException(e)));
    }
  }
}
