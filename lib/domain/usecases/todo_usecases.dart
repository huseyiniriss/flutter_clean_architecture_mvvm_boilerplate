
import 'package:flutter_clean_architecture_mvvm_boilerplate/domain/entities/todo_item.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/domain/repositories/todo_repository.dart';

class GetTodosUseCase {
  final TodoRepository repository;
  GetTodosUseCase(this.repository);

  Future<List<TodoItem>> execute() {
    return repository.getTodos();
  }
}

class AddTodoUseCase {
  final TodoRepository repository;
  AddTodoUseCase(this.repository);

  Future<void> execute(TodoItem todo) {
    return repository.addTodo(todo);
  }
}

class ToggleTodoUseCase {
  final TodoRepository repository;
  ToggleTodoUseCase(this.repository);

  Future<void> execute(String id) {
    return repository.toggleTodo(id);
  }
}

class RemoveTodoUseCase {
  final TodoRepository repository;
  RemoveTodoUseCase(this.repository);

  Future<void> execute(String id) {
    return repository.removeTodo(id);
  }
}