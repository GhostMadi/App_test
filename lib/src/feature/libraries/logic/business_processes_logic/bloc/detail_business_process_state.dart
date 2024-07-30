part of 'detail_business_process_bloc.dart';

@immutable
sealed class DetailBusinessProcessState {}

final class DetailBusinessProcessInitial extends DetailBusinessProcessState {}



class BetailBusinessProcessSuccess extends DetailBusinessProcessState{
  final DetailBusinessProcess businessProcess;

  BetailBusinessProcessSuccess({required this.businessProcess});
}
class BetailBusinessProcessLoading extends DetailBusinessProcessState{}
class BetailBusinessProcessFailed extends DetailBusinessProcessState{
  final CatchException e;

  BetailBusinessProcessFailed({required this.e});
}
