import 'package:flutter/material.dart';
import 'package:important/models/priority.dart';
import 'package:important/models/todo.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [
    Todo('Caption', 'Description', Priority.fundamental, DateTime.now()),
    Todo('Caption', 'Description', Priority.fundamental, DateTime.now()),
    Todo('Caption', 'Description', Priority.fundamental, DateTime.now()),
    Todo('Caption', 'Description', Priority.fundamental, DateTime.now()),
    Todo('Caption', 'Description', Priority.fundamental, DateTime.now()),
  ];

  List<Todo> _finishedTodos = [];

  // Properties
  List<Todo> get todos {
    return _todos;
  }

  // Properties
  List<Todo> get finishedTodos {
    return _finishedTodos;
  }

  Future<void> addTodo(Todo todo) {
    _todos.add(todo);

    notifyListeners();
  }

  Future<void> deleteTodo(Todo todo) {
    int index = _todos.indexWhere((element) => element.todoId == todo.todoId);
    _todos.removeAt(index);

    notifyListeners();
  }

  Future<void> finishTodo(Todo todo) {
    Todo temp = _todos.firstWhere((element) => element.todoId == todo.todoId);
    _todos.remove(temp);

    _finishedTodos.add(temp);

    notifyListeners();
  }
}
