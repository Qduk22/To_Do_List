import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';

/// HomeAppBar là một AppBar tùy chỉnh
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Constructor của HomeAppBar
  const HomeAppBar({
    required this.onSearchChanged,
    super.key,
  });

  /// Hàm được gọi khi người dùng thay đổi nội dung tìm kiếm
  final ValueChanged<String> onSearchChanged;

  /// Hàm build chứa nội dung của HomeAppBar
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
      title: const Text(
        /// Tiêu đề của AppBar
        'You have got 5 tasks\ntoday to complete ✍️',

        /// Số dòng tối đa của tiêu đề
        maxLines: 2,

        /// Kiểu chữ của tiêu đề
        style: TextStyle(
          /// Màu chữ của tiêu đề
          color: Colors.white,

          /// Kích thước chữ của tiêu đề
          fontSize: 24,

          /// Độ đậm của chữ của tiêu đề
          fontWeight: FontWeight.bold,
        ),
      ),

      /// Khoảng cách giữa tiêu đề và nút điều hướng
      titleSpacing: 20,

      /// Danh sách các nút điều hướng
      actions: [
        /// ClipRRect là một widget để bo tròn các góc của widget con
        ClipRRect(
          /// Bo tròn các góc của widget con
          borderRadius: const BorderRadius.all(Radius.circular(22.5)),

          /// Hiển thị ảnh avatar
          child: Image.asset(
            /// Ảnh đại diện
            AppImages.avatar,

            /// Chiều rộng của ảnh
            width: 45,

            /// Chiều cao của ảnh
            height: 45,
          ),
        ),

        /// Khoảng cách giữa các nút điều hướng
        const SizedBox(
          /// Khoảng cách theo chiều ngang
          width: 20,
        ),
      ],

      /// Căn giữa tiêu đề
      centerTitle: false,
    );
  }

  /// Kích thước ưu tiên của AppBar
  @override
  Size get preferredSize => const Size.fromHeight(70);
}
