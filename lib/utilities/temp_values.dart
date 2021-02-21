import 'package:important/models/ToDoNote.dart';
import 'package:important/models/priority.dart';

class TempValues {

    static void generateNote(List<ToDoNote> toDoNotes) {
    // toDoNotes = [];
    for (int i = 0; i <= 100; i++) {
      ToDoNote temp =
          ToDoNote(i.toString(), 'Hello', Priority.unimportant, DateTime.now());
      toDoNotes.add(temp);
    }
  }
}