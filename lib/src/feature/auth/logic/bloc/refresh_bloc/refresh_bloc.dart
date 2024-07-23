import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/src/core/constatns/app_const.dart';
import 'package:flutter_application_2/src/core/server/exceptions.dart';
import 'package:flutter_application_2/src/feature/auth/logic/model/user.dart';
import 'package:flutter_application_2/src/feature/auth/logic/repository/auth_repository.dart';
import 'package:meta/meta.dart';

part 'refresh_event.dart';
part 'refresh_state.dart';

class RefreshBloc extends Bloc<RefreshEvent, RefreshState> {
  final AuthRepository authRepository;

  RefreshBloc({required this.authRepository}) : super(RefreshInitial()) {
    on<Refresh>((event, emit) => refreshToken(event, emit));
  }

  Future<void> refreshToken(Refresh event, Emitter<RefreshState> emit) async {
    emit(RefreshLoading());
    try {
      AuthResponse authResponse =
          await authRepository.refreshToken(AppConstants.refresh);
      emit(RefreshSuccess(authResponse: authResponse));
    } catch (e) {
      emit(RefreshFailed(e: CatchException.defineException(e)));
    }
  }
}
