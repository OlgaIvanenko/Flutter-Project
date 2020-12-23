import 'package:chopper_try/models/note.dart';
import 'package:chopper_try/resourses/strings.dart';
import 'package:chopper_try/views/note_tile.dart';
import 'package:flutter/material.dart';

class NoteAdd extends StatefulWidget {
  List<NoteTile> noteDynamic = [];

  NoteAdd(this.noteDynamic);

  @override
  _NoteAddState createState() => _NoteAddState();
}

class _NoteAddState extends State<NoteAdd> {
  final text = TextEditingController();
  final title = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    text.dispose();
    title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.addNote),
        actions: [
          _buildAddNoteToScreen(),
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
              controller: title,
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
              controller: text,
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

  Widget _buildAddNoteToScreen(){
    return IconButton(
      onPressed: () {
        if (text.text == '' && title.text == '')
          Navigator.pop(context);
        else {
          Note note = Note(
            titleNote: title.text == '' ? 'Без заголовка' : title.text,
            textNote: text.text == '' ? 'Без текста' : text.text,
          );
          NoteTile tile = NoteTile(note: note);
          setState(() {
            widget.noteDynamic.add(tile);
          });
          Navigator.pop(context);
          return Future.value(true);
        }
      },
      icon: Icon(Icons.check_box),
    );
  }
}