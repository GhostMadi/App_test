part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final AuthResponse result;

  AuthSuccess({required this.result});
}

final class AuthFailed extends AuthState {
  final CatchException error;

  AuthFailed({required this.error});
}
