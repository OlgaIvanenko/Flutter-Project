import 'package:flutter/material.dart';
import 'package:notebook/mocks/note_mock.dart';
import 'package:notebook/models/note.dart';
import 'package:notebook/pages/note_add.dart';
import 'package:notebook/pages/search.dart';
import 'package:notebook/pages/term_of_use.dart';
import 'package:notebook/resources/strings.dart';
import 'package:notebook/views/note_tile.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Note get note => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildAppTitle(),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => TermOfUse(),
              ),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: Search(note),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: NoteMock.notes
              .map((note) => NoteTile(
                    note: note,
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => NoteAdd(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildAppTitle() {
    return Text(
      Strings.appTitle,
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
