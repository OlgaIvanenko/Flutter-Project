import 'package:chopper_try/pages/term_of_use.dart';
import 'package:chopper_try/pages/todos_page.dart';
import 'package:chopper_try/resourses/strings.dart';
import 'package:flutter/material.dart';

class DrawInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: _buildDrawInfo(context),
    );
  }

  Widget _buildDrawInfo(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(20, 40, 20, 10),
          child: Text(
            Strings.appTitle,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
          ),
        ),
        Divider(
          thickness: 1,
          endIndent: 20,
          color: Colors.teal,
        ),
        ListTile(
          title: Text(
            'Лицензионное соглашение',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => TermOfUse(),
              ),
            );
          },
        ),
        ListTile(
          title: Text(
            'Список дел',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => TodosPage(),
              ),
            );
          },
        )
      ],
    );
  }
}
