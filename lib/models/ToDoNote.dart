import './priority.dart';

class ToDoNote {
  String caption;
  String description;
  Priority priority;
  DateTime datetime;

  ToDoNote(this.caption, this.description, this.priority, this.datetime);
}