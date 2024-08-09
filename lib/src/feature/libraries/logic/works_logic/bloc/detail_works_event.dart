part of 'detail_works_bloc.dart';

@freezed
class DetailWorksEvent with _$DetailWorksEvent {
  const factory DetailWorksEvent.fetchWorks({required String id}) = FetchWorks;
}