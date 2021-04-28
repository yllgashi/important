import 'priority.dart';

class Todo {
  String todoId;
  String caption;
  String description;
  Priority priority;
  DateTime createdDatetime;
  DateTime finishedDatetime;
  bool done;

  Todo({
    this.todoId,
    this.caption,
    this.description,
    this.priority,
    this.createdDatetime,
  });
}
