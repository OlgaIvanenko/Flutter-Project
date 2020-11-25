import 'package:flutter/material.dart';
import 'package:notebook/pages/hero_image.dart';

class TermOfUse extends StatefulWidget {
  @override
  _TermOfUseState createState() => _TermOfUseState();
}

class _TermOfUseState extends State<TermOfUse> {
  bool checkBoxValue = false;
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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: _buildTermOfUse(),
          ),
          _buildCheckBox(),
          Container(
            child: _buildHeroWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildTermOfUse() {
    return Text(
      'Принять пользовательское соглашение',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildCheckBox() {
    return Checkbox(
        value: checkBoxValue,
        onChanged: (value) {
          setState(() {
            checkBoxValue = value;
          });
        });
  }

  Widget _buildHeroWidget() {
    return Hero(
      tag: 'thanks',
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HeroImage())),
        child: Image.asset('assets/спасибо.jpg'),
      ),
    );
  }
}
