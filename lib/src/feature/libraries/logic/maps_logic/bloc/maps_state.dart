part of 'maps_bloc.dart';

@freezed
class MapsState with _$MapsState {
  const factory MapsState.initial() = _Initial;

  const factory MapsState.success({required List<DetailMap> mapsList}) =
      Success;
  const factory MapsState.failed({required CatchException error}) = Failed;
}
