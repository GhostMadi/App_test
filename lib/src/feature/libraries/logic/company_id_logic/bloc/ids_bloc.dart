import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/src/core/server/exceptions.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/company_id_logic/model/id/id_company.dart';
import 'package:flutter_application_2/src/feature/libraries/logic/company_id_logic/repository/company_id_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ids_event.dart';
part 'ids_state.dart';
part 'ids_bloc.freezed.dart';

class IdsBloc extends Bloc<IdsEvent, IdsState> {
  final CompanyIdRepository companyIdRepository;
  IdsBloc({required this.companyIdRepository}) : super(const IdsState.initial()) {
    on<IdsEvent>((event, emit)=>event.map(fetchIds: (event)=>fetchIds(event, emit)) );
  }

  Future<void> fetchIds(FetchIds event,Emitter<IdsState>emit)async{
    try {
      List<IdCompany> ids = await companyIdRepository.fetchCompanyId();
      emit(IdsState.success(ids: ids));
    } catch (e) {
      emit(IdsState.failed(error: CatchException.defineException(e)));
    }
  }
}
