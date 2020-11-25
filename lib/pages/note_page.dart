import 'package:flutter/material.dart';
import 'package:notebook/models/note.dart';
import 'package:notebook/resources/strings.dart';
import 'package:notebook/views/note_picture.dart';

class NotePage extends StatelessWidget {
  final Note note;

  const NotePage({
    Key key,
    @required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _buildBackButton(context),
        title: Text(Strings.appTitle),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: _buildPageContent(),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  Widget _buildPageContent() {
    return Column(
      children: [
        Row(children: [
          _buildNotePicture(),
          SizedBox(width: 9),
          Flexible(
            child: Text(note.titleNote,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
          )
        ]),
        SizedBox(
          height: 29,
        ),
        Text(note.textNote,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            )),
      ],
    );
  }

  Widget _buildNotePicture() {
    return NotePicture(
      assetPath: note.imageAssetPath,
      size: 100,
    );
  }
}
