import 'package:homework/constants/app_icons.dart';

/// TaskStatus là một enum định nghĩa trạng thái của công việc
enum TaskStatus {
  /// Đã hoàn thành
  complete,

  /// Chưa hoàn thành
  incomplete,
}

/// Một extension của TaskStatus để thêm các phương thức mở rộng
extension TaskStatusExtension on TaskStatus {
  /// Phương thức get icon trả về biểu tượng của trạng thái công việc
  String get icon {
    /// Trả về biểu tượng tương ứng với trạng thái công việc
    switch (this) {
      /// Trạng thái công việc đã hoàn thành
      case TaskStatus.complete:
        return AppIcons.check;

      /// Trạng thái công việc chưa hoàn thành
      case TaskStatus.incomplete:
        return AppIcons.uncheck;
    }
  }
}
