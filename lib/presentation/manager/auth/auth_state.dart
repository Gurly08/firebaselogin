part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitialState extends AuthState{}

//SignInGoogle
class SignInGoogleLoading extends AuthState {}
class SignInGoogleError extends AuthState {
  final String message;

  SignInGoogleError(this.message);
}
class SignInGoogleSuccess extends AuthState {
  final String email;

  SignInGoogleSuccess(this.email);
}

//IsSignedIWithnGoogle
class IsSignedIWithnGoogleLoading extends AuthState {}
class IsSignedIWithnGoogleError extends AuthState {}
class IsSignedIWithnGoogleSuccess extends AuthState {}
