abstract class AuthRepositories{
  Future<bool> isRegisterUsecase(String email);
  Future<bool> registerUsecase();
  bool isSignInWithGoogle();
  Future<String?> signInWithGoogleUsecase();
}