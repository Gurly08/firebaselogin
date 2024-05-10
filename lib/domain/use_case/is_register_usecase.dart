import 'package:loginfirebase/domain/repositories/auth_repositories.dart';

class IsRegisterUsecase{
  final AuthRepositories repository;

  IsRegisterUsecase(this.repository);

  Future<bool> call(String email) {
    return repository.isRegisterUsecase(email);
  }
}