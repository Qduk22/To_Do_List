import 'package:flutter/material.dart';
import 'package:homework/data/models/task_priority.dart';
import 'package:homework/data/models/task_status.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icons.dart';
import '../../../data/models/task_model.dart';

/// TaskItem là một StatelessWidget để hiển thị một công việc
class TaskItem extends StatelessWidget {
  const TaskItem({
    required this.taskModel,
    required this.onStatusChanged,
    required this.onTap,
    super.key,
  });

  /// Model của công việc
  final TaskModel taskModel;

  /// Hàm được gọi khi người dùng thay đổi trạng thái của công việc
  final ValueChanged<TaskStatus> onStatusChanged;

  /// Hàm được gọi khi click vào TaskItem
  final VoidCallback onTap;

  /// Hàm build chứa nội dung của TaskItem
  @override
  Widget build(BuildContext context) {
    /// Container chứa nội dung của TaskItem
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        /// Chiều cao của container
        height: 80,

        /// Khoảng cách giữa các phần tử
        margin: const EdgeInsets.symmetric(
          /// Khoảng cách theo chiều ngang
          horizontal: 20,

          /// Khoảng cách theo chiều dọc
          vertical: 5,
        ),

        /// Decoration là một lớp để tạo hình dạng, màu sắc, hoặc hiệu ứng cho container
        decoration: BoxDecoration(
          /// Bo tròn các góc của container
          borderRadius: BorderRadius.circular(8),

          /// Màu nền của container
          color: AppColors.hex181818,
        ),

        /// Row là một widget chứa các widget con theo chiều ngang. Chứa màu ưu tiên, tên công việc, ngày hết hạn và trạng thái công việc
        child: Row(
          /// Danh sách các widget con
          children: [
            /// Container là một widget chứa một widget con và cung cấp các hộp chứa tùy chỉnh
            Container(
              /// Chiều rộng của container
              width: 15,

              /// Decoration là một lớp để tạo hình dạng, màu sắc, hoặc hiệu ứng cho container
              decoration: BoxDecoration(
                /// Bo tròn các góc của container
                borderRadius: const BorderRadius.only(
                  /// Góc trên bên trái
                  topLeft: Radius.circular(8),

                  /// Góc dưới bên trái
                  bottomLeft: Radius.circular(8),
                ),

                /// Màu nền của container
                color: taskModel.priority.color,
              ),
            ),

            /// Khoảng cách giữa các widget con
            const SizedBox(
              /// Khoảng cách theo chiều ngang
              width: 14,
            ),

            /// Expanded là một widget để mở rộng widget con theo chiều ngang
            Expanded(
              /// Column là một widget chứa các widget con theo chiều dọc. Chứa tên công việc và ngày hết hạn
              child: Column(
                /// Canh lề của các widget con theo chiều ngang
                crossAxisAlignment: CrossAxisAlignment.start,

                /// Canh lề của các widget con theo chiều dọc
                mainAxisAlignment: MainAxisAlignment.center,

                /// Danh sách các widget con
                children: [
                  /// Hiển thị tên công việc
                  Text(
                    /// Tên công việc
                    taskModel.name,

                    /// Kiểu chữ của tên công việc
                    style: const TextStyle(
                      /// Màu chữ của tên công việc
                      color: Colors.white,

                      /// Kích thước chữ của tên công việc
                      fontSize: 16,
                    ),
                  ),

                  /// Khoảng cách giữa các widget con

                  const SizedBox(
                    /// Khoảng cách theo chiều dọc

                    height: 5,
                  ),

                  /// Row là một widget chứa các widget con theo chiều ngang. Chứa hình ảnh lịch và ngày hết hạn
                  Row(
                    /// Danh sách các widget con
                    children: [
                      /// Hiển thị hình ảnh lịch
                      Image.asset(
                        /// Đường dẫn của hình ảnh
                        AppIcons.calendar,

                        /// Chiều rộng của hình ảnh
                        width: 15,
                      ),

                      /// Khoảng cách giữa các widget con
                      const SizedBox(
                        /// Khoảng cách theo chiều ngang
                        width: 7,
                      ),

                      /// Hiển thị ngày hết hạn
                      Text(
                        /// Ngày hết hạn
                        taskModel.displayDate,

                        /// Kiểu chữ của ngày hết hạn
                        style: const TextStyle(
                          /// Màu chữ của ngày hết hạn
                          color: Colors.white,

                          /// Kích thước chữ của ngày hết hạn
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            /// GestureDetector là một widget để xử lý các sự kiện người dùng. Chứa hình ảnh trạng thái công việc
            GestureDetector(
              /// Hàm được gọi khi người dùng nhấn vào widget
              onTap: () {
                /// Nếu công việc đã hoàn thành thì chuyển sang chưa hoàn thành và ngược lại
                if (taskModel.taskStatus == TaskStatus.complete) {
                  /// Gọi hàm onStatusChanged với tham số TaskStatus.incomplete
                  onStatusChanged.call(TaskStatus.incomplete);
                } else {
                  /// Gọi hàm onStatusChanged với tham số TaskStatus.complete
                  onStatusChanged.call(TaskStatus.complete);
                }
              },

              /// HitTestBehavior.translucent để xác định cách xử lý sự kiện khi nhấn vào widget
              behavior: HitTestBehavior.translucent,

              /// Padding là một widget để tạo khoảng cách xung quanh widget con
              child: Padding(
                /// Khoảng cách xung quanh widget con
                padding: const EdgeInsets.all(8),

                /// Image.asset là một widget để hiển thị hình ảnh từ asset
                child: Image.asset(
                  /// Đường dẫn của hình ảnh lấy từ taskModel
                  taskModel.taskStatus.icon,

                  /// Chiều rộng của hình ảnh
                  width: 26,

                  /// Chiều cao của hình ảnh
                  height: 26,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
