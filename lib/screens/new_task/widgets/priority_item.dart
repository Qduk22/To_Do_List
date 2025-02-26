import 'package:flutter/material.dart';
import 'package:homework/common_widgets/secondary_button.dart';
import 'package:homework/data/models/task_priority.dart';

/// PriorityItem là một StatelessWidget để hiển thị mức ưu tiên của công việc
class PriorityItem extends StatelessWidget {
  /// Constructor của PriorityItem
  const PriorityItem({
    required this.selectedTaskPriority,
    required this.taskPriorities,
    required this.onTaskPriorityChanged,
    super.key,
  });

  /// Mức ưu tiên được chọn
  final TaskPriority? selectedTaskPriority;

  /// Danh sách các mức ưu tiên
  final List<TaskPriority> taskPriorities;

  /// Hàm được gọi khi người dùng thay đổi mức ưu tiên
  final ValueChanged<TaskPriority> onTaskPriorityChanged;

  /// Hàm build chứa nội dung của PriorityItem
  @override
  Widget build(BuildContext context) {
    /// Danh sách các widget con của PriorityItem
    List<Widget> children = [];

    /// Duyệt qua danh sách các mức ưu tiên
    for (int i = 0; i < taskPriorities.length; i++) {
      /// Thêm một nút vào danh sách các widget con
      children.add(
        /// Expanded là một widget để mở rộng widget con theo chiều ngang để lấp đầy không gian còn trống
        Expanded(
          /// SecondaryButton là một StatelessWidget để hiển thị một nút phụ
          child: SecondaryButton(
            /// Tiêu đề của nút
            title: taskPriorities[i].title,

            /// Nếu mức ưu tiên được chọn bằng mức ưu tiên hiện tại thì nút được chọn
            isSelected: selectedTaskPriority == taskPriorities[i],

            /// Màu của nút
            color: taskPriorities[i].color,

            /// Hàm được gọi khi người dùng nhấn vào nút
            onTap: () {
              /// Gọi hàm onTaskPriorityChanged với tham số là mức ưu tiên hiện tại
              onTaskPriorityChanged.call(taskPriorities[i]);
            },
          ),
        ),
      );

      /// Nếu chưa phải mức ưu tiên cuối cùng thì thêm một khoảng cách
      if (i < taskPriorities.length - 1) {
        /// Khoảng cách giữa các widget con
        children.add(const SizedBox(width: 10));
      }
    }

    /// Trả về một Column chứa các widget con theo chiều dọc
    return Column(
      /// Canh lề của các widget con theo chiều ngang
      crossAxisAlignment: CrossAxisAlignment.start,

      /// Danh sách các widget con
      children: [
        /// Hiển thị tiêu đề
        Text(
          /// Tiêu đề
          'Priority',

          /// Kiểu chữ của tiêu đề
          style: TextStyle(
            /// Màu chữ của tiêu đề
            color: Colors.white.withOpacity(0.8),

            /// Kích thước chữ của tiêu đề
            fontSize: 20,
          ),
        ),

        /// Khoảng cách giữa các widget con
        const SizedBox(
          /// Khoảng cách theo chiều dọc
          height: 8,
        ),

        /// Row là một widget chứa các widget con theo chiều ngang chứa các nút mức ưu tiên
        Row(
          /// Danh sách các widget con
          children: children,
        ),

        /// Khoảng cách giữa các widget con
        const SizedBox(
          /// Khoảng cách theo chiều dọc
          height: 8,
        ),
      ],
    );
  }
}
