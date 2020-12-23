import 'package:chopper/chopper.dart';
import 'dart:async';
import 'package:chopper_try/models/todo_model.dart';
import 'package:chopper_try/resourses/strings.dart';
import 'package:chopper_try/services/api_error.dart';
import 'package:chopper_try/services/todo_service.dart';

class ApiClient {
  static final ChopperClient _chopperClient = ChopperClient(
    baseUrl: Strings.fakeApiBaseUrl,
    services: [
      TodoService.create(),
    ],
    converter: JsonConverter(),
  );

  static final todoService = _chopperClient.getService<TodoService>();

  Future<List<TodoModel>> getTodos() async {
    final rawTodos = (await _makeCheckedCall(() => todoService.getAllTodos()))
        .body as List<dynamic>;
    final todos =
    rawTodos.map((rawTodo) => TodoModel.fromJson(rawTodo)).toList();

    return todos;
  }

  Future<Response> _makeCheckedCall(Future<Response> Function() call) async {
    try {
      final response = await call();

      if (response.statusCode >= 400) {
        throw ApiError(
          statusCode: response.statusCode,
          message: response.error.toString(),
        );
      }

      return response;
    } on ApiError catch (ex) {
      throw ex;
    } catch (ex) {
      throw ApiError(message: Strings.errorMessage);
    }
  }
}