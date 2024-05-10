import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:loginfirebase/domain/use_case/is_sign_in_usecase.dart';
import 'package:loginfirebase/domain/use_case/sign_in_with_google_usecase.dart';
// import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IsSignInUsecase isSignInUsecase;
  final SignInWithGoogleUsecase signInWithGoogleUsecase;

  AuthBloc(this.isSignInUsecase, this.signInWithGoogleUsecase) : super(AuthInitialState()) {
    on<AuthEvent>((event, emit) async {
      if (event is IsSignedIWithnGoogleEvent) {
        emit(IsSignedIWithnGoogleLoading());

        bool isSignedIn = isSignInUsecase();
        await Future.delayed(const Duration(seconds: 3));
        if (isSignedIn) {
          emit(IsSignedIWithnGoogleSuccess());
          return;
        }
        emit(IsSignedIWithnGoogleError());
      }

      if (event is SignInGoogleEvent) {
        emit(SignInGoogleLoading());

        String? email = await signInWithGoogleUsecase();
        if (email != null) {
          emit(SignInGoogleSuccess(email));
          return;
        }
        emit(SignInGoogleError('Error SignIn...'));
      }
    });
  }
}
