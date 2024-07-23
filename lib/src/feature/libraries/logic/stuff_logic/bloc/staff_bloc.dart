import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/src/core/server/exceptions.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/stuff_logic/model/staff.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/stuff_logic/respository/staff_repository.dart';
import 'package:meta/meta.dart';

part 'staff_event.dart';
part 'staff_state.dart';

class StaffBloc extends Bloc<StaffEvent, StaffState> {
  final StaffRepository staffRepository;
  StaffBloc({required this.staffRepository}) : super(StaffInitial()) {
    on<StaffFetch>((event, emit) => staffFetch(event, emit));
  }

  Future<void> staffFetch(StaffFetch event, Emitter<StaffState> emit) async {
    emit(StaffLoading());
    try {
      List<DetailStaff> staffList = await staffRepository.fetchStaff(event.id);
      emit(StaffSuccess(staffList: staffList));
    } catch (e) {
      emit(StaffFailed(e: CatchException.defineException(e)));
    }
  }
}
