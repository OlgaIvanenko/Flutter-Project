import 'package:flutter/material.dart';
import 'package:notebook/resources/strings.dart';

class NoteAdd extends StatefulWidget {
  @override
  _NoteAddState createState() => _NoteAddState();
}

class _NoteAddState extends State<NoteAdd> {
  TextEditingController controller;
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.addNote),
        actions: [
          IconButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
            },
            icon: Icon(Icons.check_box),
          ),
        ],
      ),
      body: _buildNoteAdd(),
    );
  }

  Widget _buildNoteAdd() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: controller,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(hintText: "Заголовок"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: controller,
              maxLines: null,
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(hintText: "Введите текст заметки"),
            ),
          ),
        ],
      ),
    );
  }
}
