part of 'fetch_id_bloc.dart';

@immutable
sealed class FetchIdState {}

final class FetchIdInitial extends FetchIdState {}


final class FetchIdsSuccess extends FetchIdState{
  final List<IdCompany> ids;

  FetchIdsSuccess({required this.ids});
}
final class FetchIdsLoading extends FetchIdState{}

final class FetchIdsFailed extends FetchIdState{
  final CatchException e;

  FetchIdsFailed({required this.e});
}