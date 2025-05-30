import '../../domain/entities/todo_item.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_local_data_source.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource local;

  TodoRepositoryImpl(this.local);
  
  @override
  Future<List<TodoItem>> getTodos() async {
    return await local.getTodos();
  }

  @override
  Future<void> addTodo(TodoItem todo) async {
    final model = TodoModel(id: todo.id, title: todo.title, completed: todo.completed);
    await local.addTodo(model);
  }

  @override
  Future<void> toggleTodo(String id) async {
    await local.toggleTodo(id);
  }

  @override
  Future<void> removeTodo(String id) async {
    await local.removeTodo(id);
  }
}