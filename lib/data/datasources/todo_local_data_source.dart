import '../models/todo_model.dart';

class TodoLocalDataSource {
  final List<TodoModel> _todos = [
    TodoModel(
      id: "1",
      title: "Todo 1",
      completed: false,
    ),
    TodoModel(
      id: "2",
      title: "Todo 2",
      completed: true,
    ),
  ];

  Future<List<TodoModel>> getTodos() async => _todos;

  Future<void> addTodo(TodoModel todo) async {
    _todos.add(todo);
  }

  Future<void> toggleTodo(String id) async {
    final index = _todos.indexWhere((t) => t.id == id);
    if (index != -1) {
      _todos[index] = TodoModel(
        id: _todos[index].id,
        title: _todos[index].title,
        completed: !_todos[index].completed,
      );
    }
  }

  Future<void> removeTodo(String id) async {
    _todos.removeWhere((t) => t.id == id);
  }
}