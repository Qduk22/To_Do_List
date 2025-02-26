import 'package:homework/screens/demo/models/todo_model.dart';

import 'meta.dart';

class TodoResponse {
  int code;
  bool success;
  int timestamp;
  String message;
  List<TodoModel>? items;
  Meta? meta;
  TodoModel? data;

  TodoResponse({
    required this.code,
    required this.success,
    required this.timestamp,
    required this.message,
    required this.items,
    required this.meta,
    required this.data,
  });

  factory TodoResponse.fromJson(Map<String, dynamic> json) => TodoResponse(
        code: json["code"],
        success: json["success"],
        timestamp: json["timestamp"],
        message: json["message"],
        items: json["items"] != null
            ? List<TodoModel>.from(
                json["items"].map((x) => TodoModel.fromJson(x)))
            : null,
        meta: json["meta"] != null ? Meta.fromJson(json["meta"]) : null,
        data: json["data"] != null ? TodoModel.fromJson(json["data"]) : null,
      );

  get todos => null;

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "timestamp": timestamp,
        "message": message,
        "items": items != null
            ? List<dynamic>.from(items!.map((x) => x.toJson()))
            : null,
        "meta": meta?.toJson(),
        "data": data?.toJson()
      };
}
