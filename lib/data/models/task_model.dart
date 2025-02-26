import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:homework/data/models/task_priority.dart';
import 'package:homework/data/models/task_status.dart';

/// TaskModel là một lớp chứa thông tin của một công việc
class TaskModel {
  /// Constructor của TaskModel
  const TaskModel({
    required this.id,
    required this.name,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.priority,
    required this.taskStatus,
  });

  /// ID của công việc
  final String id;

  /// Tên của công việc
  final String name;

  /// Mô tả của công việc
  final String description;

  /// Thời gian bắt đầu của công việc
  final TimeOfDay startTime;

  /// Thời gian kết thúc của công việc
  final TimeOfDay endTime;

  /// Ngày của công việc
  final DateTime date;

  /// Mức độ ưu tiên của công việc. Có thể là "Thấp", "Trung bình" hoặc "Cao"
  final TaskPriority priority;

  /// Trạng thái của công việc. Có thể là "Chưa hoàn thành" hoặc "Đã hoàn thành"
  final TaskStatus taskStatus;

  /// Hàm copyWith tạo ra một bản sao mới của TaskModel với các thuộc tính được cung cấp
  TaskModel copyWith({
    String? id,
    String? name,
    String? description,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    DateTime? date,
    TaskPriority? priority,
    TaskStatus? taskStatus,
  }) {
    return TaskModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      date: date ?? this.date,
      priority: priority ?? this.priority,
      taskStatus: taskStatus ?? this.taskStatus,
    );
  }
}

/// TaskModelExtension là một extension của TaskModel
extension TaskModelExtension on TaskModel {
  /// Hiển thị theo định dạng ngày tháng
  String get displayDate {
    final dateFormat = DateFormat('d MMM');
    return dateFormat.format(date);
  }
}
