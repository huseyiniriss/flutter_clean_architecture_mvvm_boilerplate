
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/core/di/dependency_injection.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/presentation/view_models/auth/login_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<LoginViewModel>(context);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: const InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, obscureText: true, decoration: const InputDecoration(labelText: "Password")),
            if (vm.error != null) Text(vm.error!, style: const TextStyle(color: Colors.red)),
            ElevatedButton(
              onPressed: () async {
                final success = await vm.login(emailController.text, passwordController.text);
                if (success) {
                  sl<GoRouter>().push('/todos');
                }
              },
              child: vm.loading ? const CircularProgressIndicator() : const Text("Login"),
            ),
            ElevatedButton(
              onPressed: () async {
                sl<GoRouter>().push('/register');
              },
              child: const Text("Register"),
            )

          ],
        ),
      ),
    );
  }
}