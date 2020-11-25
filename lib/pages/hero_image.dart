import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Center(
        child: Hero(
          tag: 'thanks',
          child: Container(child: Image.asset('assets/спасибо.jpg')),
        ),
      ),
    );
  }
}
