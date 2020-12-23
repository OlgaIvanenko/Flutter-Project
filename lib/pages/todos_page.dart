import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:chopper_try/bloc/bloc_logic.dart';
import 'package:chopper_try/bloc/states.dart';
import 'package:chopper_try/models/todo_model.dart';
import 'package:chopper_try/resourses/strings.dart';
import 'package:chopper_try/views/todo_view.dart';
import 'package:flutter/material.dart';

class TodosPage extends StatefulWidget {
  @override
  _TodosPageState createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  final _bloc = BlocProvider.getBloc<BlocLogic>();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc.makeTodoCall();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.todosTitle,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w400,
          ),
        ),
       // centerTitle: true,
      ),
      body: StreamBuilder<AppState<List<TodoModel>>>(
        stream: _bloc.todoStream,
        builder: _buildResponse,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.autorenew),
        onPressed: _bloc.makeTodoCall,
      ),
    );
  }

  Widget _buildResponse(
    BuildContext context,
    AsyncSnapshot<AppState<List<TodoModel>>> snapshot,
  ) {

    if (!snapshot.hasData) {
      return Center(
        child: Text(Strings.noData),
      );
    }

    final todos = snapshot.data;

    if (todos is InitialState) {
      return Center(
        child: Text(Strings.initialTodoStateLabel),
      );
    }

    if (todos is LoadingState) {
      return _buildLoader();
    }

    if (todos is SuccessState) {
      return _buildTodos((todos as SuccessState).data);
    }

    if (todos is ErrorState) {
      return _buildError((todos as ErrorState).errorMessage);
    }

    return _buildLoader();
  }

  Widget _buildLoader() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildTodos(List<TodoModel> todos) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: todos.length,
      itemBuilder: (_, index) => TodoView(todoModel: todos[index]),
    );
  }

  Widget _buildError(String errorMessage) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Text(
          errorMessage,
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
