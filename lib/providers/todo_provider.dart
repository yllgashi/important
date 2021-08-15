import 'package:flutter/material.dart';
import 'package:important/models/priority.dart';
import 'package:important/models/todo.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      todoId: '1',
      caption: "Test1",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.fundamental,
    ),
    Todo(
      todoId: '2',
      caption: "Test2",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.unimportant,
    ),
    Todo(
      todoId: '3',
      caption: "Test3",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.useful,
    ),
    Todo(
      todoId: '4',
      caption: "Test1",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.fundamental,
    ),
    Todo(
      todoId: '5',
      caption: "Test2",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.unimportant,
    ),
    Todo(
      todoId: '6',
      caption: "Test3",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.useful,
    ),
    Todo(
      todoId: '7',
      caption: "Test1",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.fundamental,
    ),
    Todo(
      todoId: '8',
      caption: "Test2",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.unimportant,
    ),
    Todo(
      todoId: '9',
      caption: "Test3",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.useful,
    ),
    Todo(
      todoId: '10',
      caption: "Test1",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.fundamental,
    ),
    Todo(
      todoId: '11',
      caption: "Test2",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.unimportant,
    ),
    Todo(
      caption: "12",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.useful,
    ),
    Todo(
      todoId: '13',
      caption: "Test1",
      createdDatetime: DateTime.now(),
      description: "Some notes about something",
      priority: Priority.fundamental,
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

  Future<void> deleteTodo(String todoId) {
    int index = _todos.indexWhere((element) => element.todoId == todoId);
    _todos.removeAt(index);

    notifyListeners();
  }

  Future<void> finishTodo(String todoId) {
    Todo temp = _todos.firstWhere((element) => element.todoId == todoId);
    _todos.removeWhere((element) => element.todoId == todoId);

    _finishedTodos.add(temp);

    notifyListeners();
  }
}
