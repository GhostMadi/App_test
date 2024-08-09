part of 'done_works_bloc.dart';

@freezed
class DoneWorksEvent with _$DoneWorksEvent {
  const factory DoneWorksEvent.fetchDoneWorks({required String id}) = FetchDoneWorks;
}