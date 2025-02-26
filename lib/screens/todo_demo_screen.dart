import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:homework/screens/demo/models/todo_model.dart';
import 'package:homework/screens/demo/models/todo_response.dart';

class TodoDemoScreen extends StatefulWidget {
  const TodoDemoScreen({super.key});

  @override
  State<TodoDemoScreen> createState() => _TodoDemoScreenState();
}

class _TodoDemoScreenState extends State<TodoDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Demo Screen'),
      ),
      // body: Center(child: CircularProgressIndicator()),
    );
  }
}

/// Hàm lấy danh sách công việc
Future<List<TodoModel>?> getTodos() async {
  /// Tạo một Uri từ một chuỗi
  final url = Uri.parse('https://dummyjson.com/todos');

  /// Gửi một yêu cầu GET đến url
  final response = await http.get(url);
  print('Response body: ${response.body}');
  final statusCode = response.statusCode;
  print('Status code: $statusCode');

  /// Kiểm tra xem yêu cầu có thành công không
  if (response.statusCode == 200) {
    /// Decode dữ liệu nhận được từ server
    final data = jsonDecode(response.body);

    /// Tạo một đối tượng TodoResponse từ dữ liệu nhận được
    final todoResponse = TodoResponse.fromJson(data);
    final todos = todoResponse.todos;
    print('Todo Leght: ${todos.length}');
    for (final todo in todos) {
      print('+++++');
      print('ID: ${todo.id}');
      print('Todo: ${todo.todo}');
      print('Completed: ${todo.completed}');
      print('User ID: ${todo.userId}');
    }

    /// Trả về danh sách công việc
    return todos;
  } else {
    /// In ra lỗi nếu có
    debugPrint('Request failed with status: ${response.statusCode}.');
    return null;
  }
}
