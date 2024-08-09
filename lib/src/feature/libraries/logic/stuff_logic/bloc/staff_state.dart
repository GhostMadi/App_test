part of 'staff_bloc.dart';

@freezed
class StaffState with _$StaffState {
  const factory StaffState.initial() = Initial;
  const factory StaffState.success({required List<DetailStaff> listStaff})=Success;
  const factory StaffState.failed({required CatchException error})=Failed;

}
