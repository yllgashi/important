import 'package:flutter/material.dart';
import 'package:important/models/todo.dart';
import 'package:important/models/priority.dart';
import 'package:important/shared_widgets/todo_onlongpress_dialog.dart';
import 'package:important/utilities/constants.dart';

class SearchButton extends StatefulWidget {
  final List<Todo> _todos;
  SearchButton(this._todos);

  @override
  _SearchButtonState createState() => _SearchButtonState(this._todos);
}

class _SearchButtonState extends State<SearchButton> {
  final List<Todo> _todos;
  _SearchButtonState(this._todos);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search_outlined),
      onPressed: () {
        showSearch(context: context, delegate: Search(this._todos));
      },
    );
  }
}

// Delegates
class Search extends SearchDelegate {
  String _selectedResult;
  final List<Todo> _todos;

  Search(this._todos);

  @override
  List<Widget> buildActions(BuildContext context) {
    IconButton(
      icon: Icon(Icons.close),
      onPressed: () {
        query = '';
      },
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(this._selectedResult),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Todo> recommended = [];
    List<Todo> suggestionList = [];
    query.isEmpty
        ? suggestionList = recommended
        : suggestionList.addAll(
            this._todos.where(
                  (element) => element.caption.contains(query),
                ),
          );

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].caption),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                suggestionList[index].createdDatetime.toString().substring(0, 16),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              if (suggestionList[index].priority == Priority.unimportant)
                IconButton(
                  icon: Icon(
                    Icons.trip_origin,
                    color: Constants.unimportantColor,
                  ),
                )
              else if (suggestionList[index].priority == Priority.useful)
                IconButton(
                  icon: Icon(
                    Icons.trip_origin,
                    color: Constants.usefulColor,
                  ),
                )
              else if (suggestionList[index].priority == Priority.fundamental)
                IconButton(
                  icon: Icon(
                    Icons.trip_origin,
                    color: Constants.fundamentalColor,
                  ),
                )
            ],
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => TodoOnlongpressDialog(suggestionList[index]),
            );
          },
        );
      },
    );
  }
}
