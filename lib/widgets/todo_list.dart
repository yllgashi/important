import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:important/models/ToDoNote.dart';
import 'package:important/models/priority.dart';
import 'package:important/utilities/constants.dart';
import 'package:important/utilities/temp_values.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoList createState() => _TodoList();
}

class _TodoList extends State<TodoList> {
  List<ToDoNote> _toDoNotes = [];
  List<ToDoNote> _doneToDoNotes = [];


  @override
  Widget build(BuildContext context) {
    TempValues.generateNote(_toDoNotes);
    ToDoNote o = ToDoNote('1', '2', Priority.fundamental, DateTime.now());
    return ListView.builder(
      itemCount: _toDoNotes.length,
      itemBuilder: (context, i) {
      final ToDoNote item = _toDoNotes[i];
      if (i.isOdd) return Divider();

      return Dismissible(
        key: Key(item.caption),

        onDismissed: (DismissDirection dir) {
          setState(() => this._toDoNotes.removeAt(i));
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(dir == DismissDirection.startToEnd
                  ? item.caption + 'removed'
                  : item.caption + 'done'),
              action: SnackBarAction(
                label: 'UNDO',
                onPressed: () {
                  setState(() => this._toDoNotes.insert(i, item));
                },
              ),
            ),
          );
        },
        background: Container(
          color: Colors.red,
          child: Icon(Icons.delete),
          alignment: Alignment.centerLeft,
        ),
        secondaryBackground: Container(
          color: Colors.green,
          child: Icon(Icons.tour),
          alignment: Alignment.centerRight,
        ),
        child: _listItem(_toDoNotes[i]),
      );
    });
  }

  Widget _listItem(ToDoNote note) {
    return ListTile(
      title: Text(note.caption),
      subtitle: Text(note.description),
      trailing: _importanceIcons(),
    );
  }


// TODO Qeta boje ne veti se nuk po bon metoda setState() pasi qe ajo e thirr metoden build
// e ti nuk ki qetu metode build, duhet me kriju ni class te re si Stateful
  Widget _importanceIcons() {
    bool fundamental = true;
    bool useful = true;
    bool unimportant = true;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.trip_origin),
          iconSize: 18,
          color: unimportant ? Constants.unimportantColor : null,
          onPressed: () {
            setState(() {
              fundamental = false;
              useful = false;
              unimportant = true;
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.trip_origin),
          iconSize: 18,
          color: useful ? Constants.usefulColor : null,
          onPressed: () {
            setState(() {
              fundamental = false;
              useful = true;
              unimportant = false;
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.trip_origin),
          iconSize: 18,
          color: fundamental ? Constants.fundamentalColor : null,
          onPressed: () {
            setState(() {
              fundamental = true;
              useful = false;
              unimportant = false;
            });
          },
        ),
      ],
    );
  }
}
