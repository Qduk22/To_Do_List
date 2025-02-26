import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/app_colors.dart';
import '../constants/app_icons.dart';

/// PrimaryAppBar là một AppBar tùy chỉnh
class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Constructor của PrimaryAppBar
  const PrimaryAppBar({
    required this.title,
    required this.onBack,
    super.key,
  });

  /// Tiêu đề của AppBar
  final String title;

  /// Hàm được gọi khi người dùng nhấn nút "Back"
  final VoidCallback? onBack;

  /// Hàm build chứa nội dung của AppBar
  @override
  Widget build(BuildContext context) {
    /// AppBar là một widget chứa tiêu đề và nút điều hướng
    return AppBar(
      /// Màu nền của AppBar
      backgroundColor: AppColors.hex020206,

      /// Màu của các biểu tượng trên AppBar
      systemOverlayStyle: SystemUiOverlayStyle.light,

      /// Độ đục của AppBar khi cuộn
      scrolledUnderElevation: 0,

      /// Tiêu đề của AppBar
      title: Text(
        /// Tiêu đề của AppBar
        title,

        /// Kiểu chữ của tiêu đề
        style: const TextStyle(
          /// Màu chữ của tiêu đề
          color: Colors.white,

          /// Kích thước chữ của tiêu đề
          fontSize: 25,

          /// Độ đậm của chữ của tiêu đề
          fontWeight: FontWeight.bold,
        ),
      ),

      /// Khoảng cách giữa tiêu đề và nút quay lại
      leadingWidth: 68,

      /// Nút quay lại
      leading: onBack != null
          ? Padding(
              /// Khoảng cách giữa nút quay lại và mép của AppBar
              padding: const EdgeInsets.symmetric(horizontal: 12),

              /// Widget con của Padding
              child: GestureDetector(
                /// Ham được gọi khi người dùng nhấn vào GestureDetector
                onTap: onBack,

                /// Widget con của GestureDetector
                child: SizedBox(
                  /// Chiều rộng của nút quay lại
                  width: 44,

                  /// Chiều cao của nút quay lại
                  height: 44,

                  /// Canh giữa nút quay lại
                  child: Center(
                    /// Biểu tượng của nút quay lại
                    child: Image.asset(
                      /// Đường dẫn của biểu tượng quay lại
                      AppIcons.back,

                      /// Chiều rộng của biểu tượng quay lại
                      width: 29,

                      /// Chiều cao của biểu tượng quay lại
                      height: 29,
                    ),
                  ),
                ),
              ),
            )
          : null,

      /// Khoảng cách giữa tiêu đề và nút quay lại
      titleSpacing: 20,

      /// Canh giữa tiêu đề
      centerTitle: true,
    );
  }

  /// Kích thước ưu tiên của AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
