import 'package:flutter/material.dart';
import 'package:notebook/mocks/note_mock.dart';
import 'package:notebook/models/note.dart';
import 'package:notebook/pages/note_page.dart';

class Search extends SearchDelegate<NoteMock> {
  final Note note;

  Search(this.note);

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final myList = query.isEmpty
        ? NoteMock.notes
        : NoteMock.notes
            .where((element) => element.titleNote.contains(query))
            .toList();
    return ListView.builder(
      itemCount: myList.length,
      itemBuilder: (context, int index) {
        return ListTile(
          onTap: () {
            showResults(context);
          },
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                myList[index].titleNote,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                myList[index].textNote,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Divider(),
            ],
          ),
        );
      },
    );
  }
}
