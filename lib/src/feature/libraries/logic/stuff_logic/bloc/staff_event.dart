part of 'staff_bloc.dart';

@freezed
class StaffEvent with _$StaffEvent {
  const factory StaffEvent.fetchStaff({required String id}) = FetchStaff;
}