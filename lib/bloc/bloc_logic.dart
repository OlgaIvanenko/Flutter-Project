import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:chopper_try/bloc/states.dart';
import 'package:chopper_try/models/todo_model.dart';
import 'package:chopper_try/services/api_client.dart';
import 'package:chopper_try/services/api_error.dart';
import 'package:flutter/material.dart';

class BlocLogic extends BlocBase {
  final ApiClient apiClient;

  BlocLogic(this.apiClient);

  final _todoController = StreamController<AppState<List<TodoModel>>>()
    ..add(InitialState());
  Stream<AppState<List<TodoModel>>> get todoStream => _todoController.stream;

  @override
  void dispose() {
    _todoController.close();
    super.dispose();
  }

  void makeTodoCall() async {
    _makeCallForController(
      _todoController,
          () => apiClient.getTodos(),
    );
  }
  void _makeCallForController<T>(
      StreamController<AppState<T>> controller,
      Future<T> Function() call,
      ) async {
    controller.add(LoadingState());
    try {
      T data = await call();
      controller.add(SuccessState(data));
    } on ApiError catch (ex) {
      controller.add(ErrorState(ex.message));
    }
  }
}
