
import 'package:chopper_try/models/note.dart';
import 'file:///C:/Users/OlgaI/StudioProjects/chopper_try/lib/mocks/note_mock.dart';
import 'package:chopper_try/pages/draw_info.dart';
import 'package:chopper_try/pages/note_add.dart';
import 'package:chopper_try/pages/search.dart';
import 'package:chopper_try/resourses/strings.dart';
import 'package:chopper_try/views/note_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Note get note => null;
  List<NoteTile> noteDynamic = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildAppTitle(),
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
      drawer: DrawInfo(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: NoteMock.notes.map((note) => NoteTile(note: note)).toList()
            ..addAll(noteDynamic),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var status = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => NoteAdd(this.noteDynamic),
            ),
          );
          setState(() {});
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

