import 'package:chopper/chopper.dart';
import 'package:chopper_try/resourses/strings.dart';
part 'todo_service.chopper.dart';

@ChopperApi(baseUrl: Strings.todoUrl)
abstract class TodoService extends ChopperService {
  static TodoService create([ChopperClient client]) => _$TodoService(client);

  @Get()
  Future<Response> getAllTodos();
}
