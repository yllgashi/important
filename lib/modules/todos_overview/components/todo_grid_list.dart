import 'package:flutter/material.dart';
import 'package:important/models/priority.dart';
import 'package:important/models/todo.dart';
import 'package:important/providers/todo_provider.dart';
import 'package:important/utilities/constants.dart';
import 'package:provider/provider.dart';

class TodoGridList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);

    return GridView.builder(
      // physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: todoProvider.todos.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.9,
      ),
      // shrinkWrap: true,

      itemBuilder: (BuildContext ctx, index) {
          return _card(
            todo: todoProvider.todos[index],
            context: context,
          );
      },
    );
  }

  Widget _card({Todo todo, BuildContext context}) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            todo.caption,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: 5),
          Text(
              '${todo.createdDatetime.day} ${_monthName(todo.createdDatetime.month)}'),
        ],
      ),
      decoration: BoxDecoration(
        color: _cardColor(todo.priority),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  Color _cardColor(Priority priority) {
    switch (priority) {
      case Priority.fundamental:
        return Constants.fundamentalCardColor;
      case Priority.useful:
        return Constants.usefulCardColor;
      case Priority.unimportant:
        return Constants.unimportantCardColor;
      default:
        return Colors.black;
    }
  }

  String _monthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return 'No idea';
    }
  }
}
