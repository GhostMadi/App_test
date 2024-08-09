part of 'detail_works_bloc.dart';

@freezed
class DetailWorksState with _$DetailWorksState {
  const factory DetailWorksState.initial() = Initial;
  const factory DetailWorksState.success({required List<Works>listWorks}) = Success;
  const factory DetailWorksState.failed({required CatchException error}) = Failed;
}
