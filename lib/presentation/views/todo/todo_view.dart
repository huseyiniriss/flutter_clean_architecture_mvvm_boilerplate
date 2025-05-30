import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_mvvm_boilerplate/presentation/view_models/todo/todo_view_model.dart';
import 'package:provider/provider.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<TodoViewModel>(context);
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Todos")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "New todo",
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                vm.add(value);
                controller.clear();
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              vm.add(controller.text);
              controller.clear();
            },
            child: Text("Add Todo"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: vm.todos.length,
              itemBuilder: (context, index) {
                final todo = vm.todos[index];
                return ListTile(
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration:
                          todo.completed ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  leading: Checkbox(
                    value: todo.completed,
                    onChanged: (_) => vm.toggle(todo.id),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => vm.remove(todo.id),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
