import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/core/di/dependency_injection.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'presentation/view_models/auth/login_view_model.dart';
import 'presentation/view_models/auth/register_view_model.dart';
import 'presentation/view_models/todo/todo_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => TodoViewModel()..loadTodos()),
      ],
      child: MaterialApp.router(
        title: 'Clean Architecture App',
        theme: AppTheme.lightTheme,
        routerConfig: sl<GoRouter>(),
      ),
    );
  }
}
