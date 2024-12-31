part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final bool data;

  const AuthSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

final class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object> get props => [message];
}

final class LoginLoading extends AuthState {}

final class LogoutLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final String message;

  const LoginSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

final class LoginFailed extends AuthState {
  final String error;

  const LoginFailed({required this.error});

  @override
  List<Object> get props => [error];
}

final class LogoutSuccess extends AuthState {
  final String message;

  const LogoutSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

final class LogoutFailed extends AuthState {
  final String error;

  const LogoutFailed({required this.error});

  @override
  List<Object> get props => [error];
}
