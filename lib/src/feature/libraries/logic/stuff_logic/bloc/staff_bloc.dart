import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/src/core/server/exceptions.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/stuff_logic/model/staff.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/stuff_logic/respository/staff_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_event.dart';
part 'staff_state.dart';
part 'staff_bloc.freezed.dart';

class StaffBloc extends Bloc<StaffEvent, StaffState> {
  final StaffRepository staffRepository;
  StaffBloc({required this.staffRepository}) : super(const StaffState.initial()) {
    on<StaffEvent>((event, emit) =>event.map(fetchStaff: (event)=>fetchListStaff(event, emit)));
  }

  Future<void> fetchListStaff(FetchStaff event,Emitter<StaffState> emit)async{
    try {
      List<DetailStaff> listStaff= await staffRepository.fetchStaff(event.id);
      emit(StaffState.success(listStaff: listStaff));
    } catch (e) {
      emit(StaffState.failed(error: CatchException.defineException(e)));
    }
  }
}
