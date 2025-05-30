
import 'package:flutter_clean_architecture_mvvm_boilerplate/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);

  Future<bool> execute(String email, String password) {
    return repository.login(email, password);
  }
}

class RegisterUseCase {
  final AuthRepository repository;
  RegisterUseCase(this.repository);

  Future<bool> execute(String email, String password) {
    return repository.register(email, password);
  }
}