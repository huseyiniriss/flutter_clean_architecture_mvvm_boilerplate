class TodoItem {
  final String id;
  final String title;
  final bool completed;

  TodoItem({
    required this.id,
    required this.title,
    this.completed = false,
  });

  TodoItem copyWith({String? title, bool? completed}) {
    return TodoItem(
      id: id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}