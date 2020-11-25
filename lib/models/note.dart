import 'package:flutter/material.dart';

class Note {
  final String titleNote;
  final String textNote;
  final String imageAssetPath;

  const Note({
    this.titleNote,
    @required this.textNote,
    this.imageAssetPath,
  });
}
