import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  var todos = [
    Todo(id: 1, title: "first todo", done: false),
  ];

  void toggleTodoStatus(int id) {
    final todo = todos.firstWhere((todo) => todo.id == id);
    if (todo != null) {
      todo.done = !todo.done;
      notifyListeners();
    }
  }

  void addTodo(String title) {
    final newTodo = Todo(id: todos.length + 1, title: title, done: false);
    todos.add(newTodo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    todos.remove(todo);
    notifyListeners();
  }
}
