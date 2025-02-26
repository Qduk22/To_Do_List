import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/todo_model.dart';
import '../models/todo_response.dart';

class TodoService {
  /// Hàm khởi tạo private
  TodoService._internal();

  /// Singleton pattern
  static final TodoService _instance = TodoService._internal();

  /// Factory constructor để trả về instance của TodoService
  factory TodoService() => _instance;

  /// Base URL của API
  final String baseUrl = 'https://api.nstack.in/v1';

  /// Hàm lấy danh sách công việc với hai tham số là page và limit để phân trang
  Future<List<TodoModel>> getTodos({
    int page = 1,
    int limit = 20,
  }) async {
    /// Bước 1: Tạo url với tham số page và limit
    final url = Uri.parse('$baseUrl/todos').replace(
      queryParameters: {
        'limit': limit.toString(),
        'page': page.toString(),
      },
    );

    /// Bước 2: Gửi request GET đến API
    final response = await http.get(url);

    /// Bước 3: Kiểm tra mã trạng thái của response
    if (response.statusCode == 200) {
      /// Bước 4: Parse dữ liệu JSON từ response body
      final json = jsonDecode(response.body);

      /// Bưước 5: Parse dữ liệu JSON thành đối tượng TodoResponse
      final todoResponse = TodoResponse.fromJson(json);
      return todoResponse.items ?? [];
    } else {
      /// Nếu request thất bại thì throw Exception
      throw Exception('Failed to load todos with error: ${response.body}');
    }
  }

  /// Hàm thêm công việc mới
  Future<TodoResponse> createTodo({
    required String title,
    required String description,
    required bool isCompleted,
  }) async {
    /// Bước 1: Tạo url
    final url = Uri.parse('$baseUrl/todos');

    /// Bước 2: Gửi request POST đến API
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'title': title,
        'description': description,
        'is_completed': isCompleted,
      }),
    );

    /// Bước 3: Kiểm tra mã trạng thái của response
    if (response.statusCode == 200 || response.statusCode == 201) {
      /// Bước 4: Parse dữ liệu JSON từ response body
      final json = jsonDecode(response.body);

      /// Bước 5: Parse dữ liệu JSON thành đối tượng TodoResponse
      return TodoResponse.fromJson(json);
    } else {
      /// Nếu request thất bại thì throw Exception
      throw Exception('Failed to create todo with error: ${response.body}');
    }
  }

  /// Hàm cập nhật công việc
  Future<TodoResponse> updateTodo({
    required String id,
    required String title,
    required String description,
    required bool isCompleted,
  }) async {
    /// Bước 1: Tạo url
    final url = Uri.parse('$baseUrl/todos/$id');

    /// Bước 2: Gửi request PUT đến API
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {
          'title': title,
          'description': description,
          'is_completed': isCompleted,
        },
      ),
    );

    /// Bước 3: Kiểm tra mã trạng thái của response
    if (response.statusCode == 200) {
      /// Bước 4: Parse dữ liệu JSON từ response body
      final json = jsonDecode(response.body);

      /// Bước 5: Parse dữ liệu JSON thành đối tượng TodoResponse
      return TodoResponse.fromJson(json);
    } else {
      /// Nếu request thất bại thì throw Exception
      throw Exception('Failed to update todo with error: ${response.body}');
    }
  }

  /// Hàm xoá công việc
  Future<TodoResponse> deleteTodo({
    required String id,
  }) async {
    /// Bước 1: Tạo url
    final url = Uri.parse('$baseUrl/todos/$id');

    /// Bước 2: Gửi request PUT đến API
    final response = await http.delete(url);

    /// Bước 3: Kiểm tra mã trạng thái của response
    if (response.statusCode == 200) {
      /// Bước 4: Parse dữ liệu JSON từ response body
      final json = jsonDecode(response.body);

      /// Bước 5: Parse dữ liệu JSON thành đối tượng TodoResponse
      return TodoResponse.fromJson(json);
    } else {
      /// Nếu request thất bại thì throw Exception
      throw Exception('Failed to delete todo with error: ${response.body}');
    }
  }
}
