part of 'refresh_bloc.dart';

@immutable
sealed class RefreshState {}

final class RefreshInitial extends RefreshState {}

class RefreshSuccess extends RefreshState {
  final AuthResponse authResponse;
  RefreshSuccess({required this.authResponse});
}

class RefreshLoading extends RefreshState {}

class RefreshFailed extends RefreshState {
  final CatchException e;

  RefreshFailed({required this.e});
}
