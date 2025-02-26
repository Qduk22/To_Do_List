import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

/// PrimaryButton là một nút tùy chỉnh
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  /// Tiêu đề của nút
  final String title;

  /// Hàm được gọi khi người dùng nhấn nút
  final VoidCallback onTap;

  /// Hàm build chứa nội dung của nút
  @override
  Widget build(BuildContext context) {
    /// InkWell là một widget chứa một hàm được gọi khi người dùng nhấn vào nó
    return InkWell(
      /// Hàm được gọi khi người dùng nhấn nút
      onTap: onTap,

      /// Nội dung của nút
      child: Container(
        /// Chiều cao của nút
        height: 50,

        /// Định dạng của nút
        decoration: const BoxDecoration(
          /// Gradient của nút
          gradient: LinearGradient(
            /// Màu của gradient
            colors: [
              /// Màu bắt đầu của gradient
              AppColors.hexBA83DE,

              /// Màu kết thúc của gradient
              AppColors.hexDE83B0,
            ],

            /// Điểm bắt đầu của gradient
            begin: Alignment.centerLeft,

            /// Điểm kết thúc của gradient
            end: Alignment.centerRight,
          ),

          /// Bo tròn mép của nút
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),

        /// Nội dung của nút
        child: Center(
          /// Canh giữa nội dung của nút
          child: Text(
            /// Tiêu đề của nút
            title,

            /// Kiểu chữ của tiêu đề
            style: const TextStyle(
              /// Màu chữ của tiêu đề
              color: Colors.white,

              /// Kích thước chữ của tiêu đề
              fontSize: 16,

              /// Độ đậm của chữ của tiêu đề
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
