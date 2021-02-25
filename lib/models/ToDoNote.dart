import './priority.dart';

class ToDoNote {
  String caption;
  String description;
  Priority priority;
  DateTime createdDatetime;
  DateTime finishedDatetime;
  bool done;

  ToDoNote(this.caption, this.description, this.priority, this.createdDatetime);
}