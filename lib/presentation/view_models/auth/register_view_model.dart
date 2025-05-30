
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/core/di/dependency_injection.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/domain/usecases/auth_usecases.dart';

class RegisterViewModel extends ChangeNotifier {
  final RegisterUseCase _registerUseCase = sl<RegisterUseCase>();

  bool _loading = false;
  bool get loading => _loading;
  String? error;

  Future<bool> register(String email, String password) async {
    _loading = true;
    notifyListeners();

    final success = await _registerUseCase.execute(email, password);
    if (!success) error = "Registration failed";

    _loading = false;
    notifyListeners();
    return success;
  }
}