import 'package:loginfirebase/domain/repositories/auth_repositories.dart';

class SignInWithGoogleUsecase{
  final AuthRepositories repository;

  SignInWithGoogleUsecase(this.repository);

  Future<String?> call() {
    return repository.signInWithGoogleUsecase();
  }
}