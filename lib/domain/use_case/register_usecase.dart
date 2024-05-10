import 'package:loginfirebase/domain/repositories/auth_repositories.dart';

class RegisterUsecase{
  final AuthRepositories repository;

  RegisterUsecase(this.repository);

  Future<bool> call() {
    return repository.registerUsecase();
  }
}