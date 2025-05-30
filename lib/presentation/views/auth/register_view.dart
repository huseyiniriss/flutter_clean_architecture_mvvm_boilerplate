
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/presentation/view_models/auth/register_view_model.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<RegisterViewModel>(context);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: const InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, obscureText: true, decoration: const InputDecoration(labelText: "Password")),
            if (vm.error != null) Text(vm.error!, style: const TextStyle(color: Colors.red)),
            ElevatedButton(
              onPressed: () async {
                final success = await vm.register(emailController.text, passwordController.text);
                if (success) Navigator.pop(context);
              },
              child: vm.loading ? const CircularProgressIndicator() : const Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}