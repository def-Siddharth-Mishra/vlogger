import 'package:json_annotation/json_annotation.dart';
import 'package:vlogger/data/entities/todo.dart';

part 'todos_response.g.dart';

@JsonSerializable()
class TodosResponse {
  final List<Todo> todos;
  final int total;
  final int skip;
  final int limit;
  TodosResponse(this.todos, this.total, this.skip, this.limit);

  factory TodosResponse.fromJson(Map<String, dynamic> json) =>
      _$TodosResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TodosResponseToJson(this);
}

TodosResponse deserializeTodosResponse(Map<String, dynamic> json) =>
    TodosResponse.fromJson(json);

Map<String, dynamic> serializeTodosResponse(TodosResponse object) =>
    object.toJson();
