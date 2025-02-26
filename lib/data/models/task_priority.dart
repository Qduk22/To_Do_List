import 'package:homework/constants/app_colors.dart';
import 'package:flutter/material.dart';

/// TaskPriority là một enum định nghĩa mức độ ưu tiên của công việc
enum TaskPriority {
  /// Cao
  high,

  /// Trung bình
  medium,

  /// Thấp
  low,
}

/// Một extension của TaskPriority để thêm các phương thức mở rộng
extension TaskPriorityExtension on TaskPriority {
  /// Phương thức getColor trả về màu của mức độ ưu tiên
  Color get color {
    /// Trả về màu tương ứng với mức độ ưu tiên
    switch (this) {
      /// Mức độ ưu tiên cao
      case TaskPriority.high:
        return AppColors.hexFACBBA;

      /// Mức độ ưu tiên trung bình
      case TaskPriority.medium:
        return AppColors.hexD7F0FF;

      /// Mức độ ưu tiên thấp
      case TaskPriority.low:
        return AppColors.hexFAD9FF;
    }
  }

  /// Phương thức getTitle trả về tiêu đề của mức độ ưu tiên
  String get title {
    /// Trả về tiêu đề tương ứng với mức độ ưu tiên
    switch (this) {
      /// Mức độ ưu tiên cao
      case TaskPriority.high:
        return "High";

      /// Mức độ ưu tiên trung bình
      case TaskPriority.medium:
        return "Medium";

      /// Mức độ ưu tiên thấp
      case TaskPriority.low:
        return "Low";
    }
  }
}
