import 'package:chopper_try/models/todo_model.dart';
import 'package:flutter/material.dart';

class TodoView extends StatelessWidget {
  final TodoModel todoModel;

  const TodoView({
    Key key,
    @required this.todoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.fromLTRB(2,5,2,5),
      color: Colors.teal[50],
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListTile(
          trailing: Text(
            todoModel.id.toString(),
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          title: Text(todoModel.title,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 19,
          ),),
          leading: _buildStatusIcon(todoModel.completed),
        ),
      ),
    );
  }

  Widget _buildStatusIcon(bool isCompleted) {
    return Icon(isCompleted ? Icons.check_circle : Icons.close);
  }
}
