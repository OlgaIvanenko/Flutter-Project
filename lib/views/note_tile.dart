import 'package:flutter/material.dart';
import 'package:notebook/models/note.dart';
import 'package:notebook/pages/note_page.dart';
import 'package:notebook/views/note_picture.dart';

class NoteTile extends StatelessWidget {
  final Note note;

  const NoteTile({
    Key key,
    @required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (BuildContext context) => NotePage(note: note)),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            NotePicture(
              assetPath: note.imageAssetPath,
            ),
            SizedBox(width: 19),
            Expanded(
              child: _buildNoteShortInfo(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNoteShortInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${note.titleNote}",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          note.textNote,
          maxLines: 3,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
