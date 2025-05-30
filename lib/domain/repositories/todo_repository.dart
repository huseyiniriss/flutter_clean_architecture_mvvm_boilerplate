
import 'package:flutter_clean_architecture_mvvm_boilerplate/domain/entities/todo_item.dart';

abstract class TodoRepository {
  Future<List<TodoItem>> getTodos();
  Future<void> addTodo(TodoItem todo);
  Future<void> toggleTodo(String id);
  Future<void> removeTodo(String id);
}