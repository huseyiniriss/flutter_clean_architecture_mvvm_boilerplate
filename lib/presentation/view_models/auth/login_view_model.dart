
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/core/di/dependency_injection.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/domain/usecases/auth_usecases.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginUseCase _loginUseCase = sl<LoginUseCase>();

  bool _loading = false;
  bool get loading => _loading;
  String? error;

  Future<bool> login(String email, String password) async {
    _loading = true;
    notifyListeners();

    final success = await _loginUseCase.execute(email, password);
    if (!success) error = "Invalid credentials";

    _loading = false;
    notifyListeners();
    return success;
  }
}