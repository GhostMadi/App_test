part of 'ids_bloc.dart';

@freezed
class IdsState with _$IdsState {
  const factory IdsState.initial() = Initial;
  const factory IdsState.success({required List<IdCompany> ids}) = Success;
  const factory IdsState.failed({required CatchException error}) = Failed;

}
