

import 'package:flutter_clean_architecture_mvvm_boilerplate/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/data/datasources/todo_local_data_source.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/data/repositories/auth_repository_impl.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/data/repositories/todo_repository_impl.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/domain/repositories/todo_repository.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/domain/usecases/auth_usecases.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/domain/usecases/todo_usecases.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/presentation/views/auth/login_view.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/presentation/views/auth/register_view.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/presentation/views/todo/todo_view.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  // Datasources
  sl.registerLazySingleton(() => AuthRemoteDataSource());
  sl.registerLazySingleton(() => TodoLocalDataSource());

  // Repositories (datasource geçilerek)
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(sl()));

  // UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => GetTodosUseCase(sl()));
  sl.registerLazySingleton(() => AddTodoUseCase(sl()));
  sl.registerLazySingleton(() => ToggleTodoUseCase(sl()));
  sl.registerLazySingleton(() => RemoveTodoUseCase(sl()));

  //Screens
  sl.registerSingleton<GoRouter>(
    GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const LoginView(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => const RegisterView(),
        ),
        GoRoute(
          path: '/todos',
          builder: (context, state) => const TodoView(),
        ),
      ],
    ),
  );
}