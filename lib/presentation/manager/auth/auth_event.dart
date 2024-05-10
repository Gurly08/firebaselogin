part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class IsSignedIWithnGoogleEvent extends AuthEvent{}

final class SignInGoogleEvent extends AuthEvent{}