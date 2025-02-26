import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

/// ProgressItem là một StatelessWidget để hiển thị tiến độ của người dùng
class ProgressItem extends StatelessWidget {
  /// Constructor của ProgressItem
  const ProgressItem({
    super.key,
    required this.numberOfCompletedTask,
    required this.numberOfTasks,
  });

  /// Số lượng công việc
  final int numberOfTasks;

  /// Số lượng công việc đã hoàn thành
  final int numberOfCompletedTask;

  /// Hàm build chứa nội dung của ProgressItem
  @override
  Widget build(BuildContext context) {
    /// Kích thước của thanh tiến độ
    /// Bằng chiều rộng của màn hình trừ 2 lần (20 + 20)
    final progressBarWidth = MediaQuery.of(context).size.width - 2 * (20 + 20);

    /// Container là một widget chứa một widget con và cung cấp các hộp chứa tùy chỉnh
    return Container(
      /// Khoảng cách giữa các phần tử
      margin: const EdgeInsets.symmetric(
        /// Khoảng cách theo chiều ngang
        horizontal: 20,
      ),

      /// Khoảng cách giữa các widget con
      padding: const EdgeInsets.symmetric(
        /// Khoảng cách theo chiều ngang
        horizontal: 20,

        /// Khoảng cách theo chiều dọc
        vertical: 20,
      ),

      /// BoxDecoration là một lớp để tạo hình dạng, bo góc, và tạo gradient cho container
      decoration: BoxDecoration(
        /// Bo tròn các góc của container
        borderRadius: BorderRadius.circular(8),

        /// Màu nền của container
        color: AppColors.hex181818,
      ),

      /// Column là một widget chứa các widget con theo chiều dọc
      child: Column(
        /// Canh lề của các widget con theo chiều ngang
        crossAxisAlignment: CrossAxisAlignment.stretch,

        /// Danh sách các widget con

        children: [
          /// Hiển thị tiêu đề
          const Text(
            /// Hiển thị tiêu đề
            'Daily Task',

            /// Kiểu chữ của tiêu đề
            style: TextStyle(
              /// Màu chữ của tiêu đề
              color: Colors.white,

              /// Kích thước chữ của tiêu đề
              fontSize: 18,
            ),
          ),

          /// Khoảng cách giữa các widget con
          const SizedBox(
            /// Khoảng cách theo chiều dọc
            height: 10,
          ),

          /// Hiển thị số lượng công việc đã hoàn thành
          Text(
            /// Số lượng công việc đã hoàn thành
            '$numberOfCompletedTask/$numberOfTasks Task Completed',

            /// Kiểu chữ của đoạn văn bản
            style: TextStyle(
              /// Màu chữ của đoạn văn bản
              color: Colors.white.withOpacity(0.8),

              /// Kích thước chữ của đoạn văn bản
              fontSize: 16,
            ),
          ),

          /// Khoảng cách giữa các widget con
          const SizedBox(
            /// Khoảng cách theo chiều dọc
            height: 10,
          ),

          /// Hiển thị tiến độ công việc
          Row(
            /// Row là một widget chứa các widget con theo chiều ngang
            children: [
              /// Expanded là một widget mở rộng để điền vào không gian còn trống
              Expanded(
                /// Hiển thị một đoạn văn bản
                child: Text(
                  /// Hiển thị một đoạn văn bản
                  'You are almost done go ahead',

                  /// Kiểu chữ của đoạn văn bản
                  style: TextStyle(
                    /// Màu chữ của đoạn văn bản
                    color: Colors.white.withOpacity(0.8),

                    /// Kích thước chữ của đoạn văn bản
                    fontSize: 14,
                  ),
                ),
              ),

              /// Hiển thị phần trăm công việc đã hoàn thành
              Text(
                /// Phần trăm công việc đã hoàn thành
                '${(numberOfCompletedTask / numberOfTasks * 100).floor()}%',

                /// Kiểu chữ của đoạn văn bản
                style: const TextStyle(
                  /// Màu chữ của đoạn văn bản
                  color: Colors.white,

                  /// Kích thước chữ của đoạn văn bản
                  fontSize: 18,
                ),
              ),
            ],
          ),

          /// Khoảng cách giữa các widget con
          const SizedBox(
            /// Khoảng cách theo chiều dọc
            height: 6,
          ),

          /// Dùng Stack để chồng các widget con lên nhau hiển thị tiến độ công việc
          Stack(
            /// Danh sách các widget con
            children: [
              /// Hiển thị nền của thanh tiến độ
              Container(
                /// Chiều cao của container
                height: 18,

                /// BoxDecoration là một lớp để tạo hình dạng, bo góc, và tạo gradient cho container
                decoration: BoxDecoration(
                  /// Bo tròn các góc của container
                  borderRadius: BorderRadius.circular(20),

                  /// Màu nền của container
                  color: AppColors.hexBA83DE.withOpacity(0.41),
                ),
              ),

              /// Hiển thị thanh tiến độ
              Container(
                /// Chiều cao của container
                height: 18,

                /// Chiều rộng của container. Tính theo công thức: (Chiều rộng của màn hình - 2 * (20 + 20)) * (Số lượng công việc đã hoàn thành / Số lượng công việc)
                width: progressBarWidth * numberOfCompletedTask / numberOfTasks,

                /// BoxDecoration là một lớp để tạo hình dạng, bo góc, và tạo gradient cho container
                decoration: BoxDecoration(
                  /// Bo tròn các góc của container
                  borderRadius: BorderRadius.circular(20),

                  /// Màu nền của container
                  color: AppColors.hexBA83DE,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
