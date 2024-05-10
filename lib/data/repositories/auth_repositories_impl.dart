import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginfirebase/data/datasource/auth_datasource.dart';
import 'package:loginfirebase/domain/repositories/auth_repositories.dart';

class AuthRepositoriesImpl implements AuthRepositories{
  AuthRepositoriesImpl(this.authDatasource);

  final AuthDatasource authDatasource;
  
  @override
  Future<bool> isRegisterUsecase(String email) {
    // TODO: implement isRegisterUsecase
    throw UnimplementedError();
  }

  @override
  Future<bool> registerUsecase() {
    // TODO: implement registerUsecase
    throw UnimplementedError();
  }

  @override
  bool isSignInWithGoogle() {
    return FirebaseAuth.instance.currentUser != null;
  }
  
  @override
  Future<String?> signInWithGoogleUsecase() async{
    try {
      // Trigger the authentication flow
        final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();

        //Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth = await googleuser?.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
        );

        // Once signed in, return the usarCredential
        UserCredential userCredentialResult = await FirebaseAuth.instance.signInWithCredential(credential);
        return userCredentialResult.user?.email;
    } catch (e) {
      debugPrint('Err signInWithGoogle $e');
      return null;
    }
  }
}