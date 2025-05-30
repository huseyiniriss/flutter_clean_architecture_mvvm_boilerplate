import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/core/di/dependency_injection.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/domain/entities/todo_item.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/domain/usecases/todo_usecases.dart';
import 'package:uuid/uuid.dart';

class TodoViewModel extends ChangeNotifier {
  final GetTodosUseCase _getTodos = sl<GetTodosUseCase>();
  final AddTodoUseCase _addTodo = sl<AddTodoUseCase>();
  final ToggleTodoUseCase _toggleTodo = sl<ToggleTodoUseCase>();
  final RemoveTodoUseCase _removeTodo = sl<RemoveTodoUseCase>();

  List<TodoItem> _todos = [];
  List<TodoItem> get todos => _todos;

  Future<void> loadTodos() async {
    _todos = await _getTodos.execute();
    notifyListeners();
  }

  Future<void> add(String title) async {
    final id = const Uuid().v4();
    await _addTodo.execute(TodoItem(id: id, title: title));
    await loadTodos();
  }

  Future<void> toggle(String id) async {
    await _toggleTodo.execute(id);
    await loadTodos();
  }

  Future<void> remove(String id) async {
    await _removeTodo.execute(id);
    await loadTodos();
  }
}
