import 'package:loginfirebase/domain/repositories/auth_repositories.dart';

class IsSignInUsecase{
  final AuthRepositories repository;

  IsSignInUsecase(this.repository);

  bool call() {
    return repository.isSignInWithGoogle();
  }
}