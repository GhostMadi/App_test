import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/src/core/server/exceptions.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/company_id_logic/model/id/id_company.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/company_id_logic/repository/company_id_repository.dart';
import 'package:meta/meta.dart';

part 'fetch_id_event.dart';
part 'fetch_id_state.dart';

class FetchIdBloc extends Bloc<FetchIdEvent, FetchIdState> {
  final CompanyIdRepository companyIdRepository;
  FetchIdBloc({required this.companyIdRepository}) : super(FetchIdInitial()) {
    on<FetchIds>((event, emit) => fetchIds(event, emit));
  }

  Future<void> fetchIds(FetchIds event, Emitter<FetchIdState> emit) async {
    emit(FetchIdsLoading());
    try {
      List<IdCompany> ids = await companyIdRepository.fetchCompanyId();

      emit(FetchIdsSuccess(ids: ids));
    } catch (e) {
      emit(FetchIdsFailed(e: CatchException.defineException(e)));
    }
  }
}
