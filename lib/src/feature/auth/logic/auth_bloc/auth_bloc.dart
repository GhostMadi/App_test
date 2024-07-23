import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/src/core/server/exceptions.dart';
import 'package:flutter_application_2/src/feature/auth/logic/model/user.dart';
import 'package:flutter_application_2/src/feature/auth/logic/repository/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LogIn>((event, emit) => _logIn(event, emit));
  }

  Future<void> _logIn(LogIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      AuthResponse result = await authRepository.logIn(
        email: event.email,
        password: event.password,
      );
      emit(AuthSuccess(result: result));
    } catch (e) {
      emit(AuthFailed(error: CatchException.defineException(e)));
    }
  }
}
