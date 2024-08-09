part of 'done_works_bloc.dart';

@freezed
class DoneWorksState with _$DoneWorksState {
  const factory DoneWorksState.initial() = Initial;
  const factory DoneWorksState.success({required  List<DoneWork> listDoneWorks}) = Success;
  const factory DoneWorksState.failed({required CatchException error}) = Failed;


}
