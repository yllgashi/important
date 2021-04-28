import 'package:flutter/material.dart';
import 'package:important/models/priority.dart';
import 'package:important/models/todo.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      caption: "Test1",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.fundamental,
    ),
    Todo(
      caption: "Test2",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.unimportant,
    ),
    Todo(
      caption: "Test3",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.useful,
    ),
    Todo(
      caption: "Test1",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.fundamental,
    ),
    Todo(
      caption: "Test2",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.unimportant,
    ),
    Todo(
      caption: "Test3",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.useful,
    ),
    Todo(
      caption: "Test1",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.fundamental,
    ),
    Todo(
      caption: "Test2",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.unimportant,
    ),
    Todo(
      caption: "Test3",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.useful,
    ),
    Todo(
      caption: "Test1",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.fundamental,
    ),
    Todo(
      caption: "Test2",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.unimportant,
    ),
    Todo(
      caption: "Test3",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.useful,
    ),
    Todo(
      caption: "Test1",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.fundamental,
    ),
    Todo(
      caption: "Test2",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.unimportant,
    ),
    Todo(
      caption: "Test3",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.useful,
    ),
    Todo(
      caption: "Test3",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.useful,
    ),
    Todo(
      caption: "Test1",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.fundamental,
    ),
    Todo(
      caption: "Test2",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.unimportant,
    ),
    Todo(
      caption: "Test3",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.useful,
    ),
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
