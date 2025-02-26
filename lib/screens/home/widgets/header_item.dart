import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

/// HeaderItem là một StatelessWidget để hiển thị tiêu đề của một phần
class HeaderItem extends StatelessWidget {
  /// Constructor của HeaderItem
  const HeaderItem({
    required this.title,
    required this.onSeeAllTap,
    super.key,
  });

  /// Tiêu đề của phần
  final String title;

  final VoidCallback onSeeAllTap;

  /// Hàm build chứa nội dung của HeaderItem
  @override
  Widget build(BuildContext context) {
    /// Padding là một widget chứa một widget con và cung cấp khoảng cách xung quanh cho widget con
    return Padding(
      /// Khoảng cách giữa các phần tử
      padding: const EdgeInsets.symmetric(
        /// Khoảng cách theo chiều ngang
        horizontal: 20,

        /// Khoảng cách theo chiều dọc
        vertical: 16,
      ),

      /// Hiển thị tiêu đề và nút "See All" theo hàng ngang
      child: Row(
        /// Danh sách các widget con
        children: [
          /// Expanded là một widget mở rộng để mở rộng widget con của nó để lấp đầy không gian còn trống
          Expanded(
            /// Hiển thị tiêu đề
            child: Text(
              /// Hiển thị tiêu đề
              title,

              /// Kiểu chữ của tiêu đề
              style: const TextStyle(
                /// Kích thước chữ của tiêu đề
                fontSize: 22,

                /// Màu chữ của tiêu đề
                color: Colors.white,
              ),
            ),
          ),

          /// Nut "See All"
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onSeeAllTap,
            child: const Text(
              /// Nội dung của nút "See All"
              'See All',

              /// Kiểu chữ của tiêu đề
              style: TextStyle(
                /// Kích thước chữ của tiêu đề
                fontSize: 16,

                /// Màu chữ của tiêu đề
                color: AppColors.hexBA83DE,
              ),
            ),
          )
        ],
      ),
    );
  }
}
