part of 'ids_bloc.dart';

@freezed
class IdsEvent with _$IdsEvent {
  const factory IdsEvent.fetchIds() = FetchIds;
}