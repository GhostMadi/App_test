part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LogIn extends AuthEvent {
  final String email;
  final String password;

  LogIn({required this.email, required this.password});
}
