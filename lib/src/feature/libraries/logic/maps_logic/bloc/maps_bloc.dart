import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/src/core/server/exceptions.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/maps_logic/model/map.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/maps_logic/repository/maps_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'maps_event.dart';
part 'maps_state.dart';
part 'maps_bloc.freezed.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  final MapsRepository mapsRepository;
  MapsBloc({required this.mapsRepository}) : super(const MapsState.initial()) {
    on<MapsEvent>(
        (event, emit) => event.map(fetchMaps: (event) => fetchMaps(event, emit)));
  }

  Future<void> fetchMaps(FetchMaps event, Emitter<MapsState> emit) async {
    emit(const MapsState.initial());
    try {
        List<DetailMap> result = await mapsRepository.fetchMaps(event.id);
        emit(MapsState.success(mapsList: result));
    } catch (e) {
        emit(MapsState.failed(error: CatchException.defineException(e)));
      
    }
  }
}
