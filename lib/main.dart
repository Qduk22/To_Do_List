import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'my_app.dart';

/// Hàm main chạy ứng dụng
void main() {
  /// runApp nhận vào một widget và chạy ứng dụng
  runApp(const MyApp());
  // getTodoss();
}

// Future<void> getTodoss() async {
//   final url = Uri.parse('https://dummyjson.com/todos');
//   final response = await http.get(url);
//   print('Response body: ${response.body}');
//   print('Status code: ${response.statusCode}');
// }
