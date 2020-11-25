import 'package:flutter/material.dart';
import 'package:notebook/views/rounded_corners.dart';

class NotePicture extends StatelessWidget {
  final String assetPath;
  final double size;
  //final String tag;

  const NotePicture({
    Key key,
    // @required this.tag,
    @required this.assetPath,
    this.size = 48,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //tag: tag,
      child: RoundedCorners(
        child: Container(
          width: size,
          child: Image.asset(assetPath),
        ),
      ),
    );
  }
}
