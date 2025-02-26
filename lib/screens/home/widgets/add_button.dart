import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icons.dart';

/// AddButton là một widget hiển thị nút thêm công việc
class AddButton extends StatelessWidget {
  /// Constructor của AddButton
  const AddButton({
    super.key,
    required this.onTap,
  });

  /// Hàm onTap được gọi khi nút được nhấn
  final VoidCallback onTap;

  /// Hàm build chứa nội dung của nút
  @override
  Widget build(BuildContext context) {
    /// InkWell là một widget chứa một hàm được gọi khi người dùng nhấn vào nó
    return InkWell(
      /// Bo tròn nút
      customBorder: const CircleBorder(),

      /// Hàm được gọi khi người dùng nhấn nút
      onTap: onTap,

      /// Nội dung của nút
      child: Container(
        /// Chiều rộng của nút
        width: 71,

        /// Chiều cao của nút
        height: 71,

        /// Định dạng của nút
        decoration: const BoxDecoration(
          /// Hình dạng của nút
          shape: BoxShape.circle,

          /// Gradient của nút
          gradient: LinearGradient(
            /// Màu nền của nút
            colors: [
              /// Màu bắt đầu của gradient
              AppColors.hexDE83B0,

              /// Màu kết thúc của gradient
              AppColors.hexC59ADF,
            ],

            /// Điểm bắt đầu của gradient
            begin: Alignment.topLeft,

            /// Điểm kết thúc của gradient
            end: Alignment.bottomRight,
          ),
        ),

        /// Canh giữa nội dung của nút
        child: Center(
          /// Nội dung của nút
          child: Image.asset(
            /// Đường dẫn của biểu tượng
            AppIcons.plus,

            /// Chiều rộng của biểu tượng
            width: 24.0,

            /// Chiều cao của biểu tượng
            height: 24.0,
          ),
        ),
      ),
    );
  }
}
