import 'package:flutter/material.dart';
import 'package:homework/constants/app_colors.dart';

import '../../../constants/app_icons.dart';

/// SearchField là một StefulWidget để hiển thị ô tìm kiếm
class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    required this.hintText,
    required this.onChanged,
  });

  /// Gợi ý cho ô tìm kiếm
  final String hintText;

  /// Hàm được gọi khi người dùng thay đổi nội dung tìm kiếm
  final ValueChanged<String> onChanged;

  /// Hàm createState tạo ra một State mới cho widget
  @override
  State<SearchField> createState() => _SearchFieldState();
}

/// _SearchFieldState là một State của SearchField
class _SearchFieldState extends State<SearchField> {
  /// TextEditingController để quản lý nội dung của ô tìm kiếm
  final _controller = TextEditingController();

  /// Hàm build chứa nội dung của SearchField
  @override
  Widget build(BuildContext context) {
    /// TextFormField là một widget để nhập văn bản
    return TextFormField(
      /// Controller của TextFormField
      controller: _controller,

      /// Kiểu chữ của TextFormField
      style: const TextStyle(
        /// Màu chữ của TextFormField
        color: Colors.white,

        /// Kích thước chữ của TextFormField
        fontSize: 16,
      ),

      /// InputDecoration là một lớp để tùy chỉnh hình dạng và hiển thị của TextFormField
      decoration: InputDecoration(
        /// Gợi ý cho ô tìm kiếm
        hintText: widget.hintText,

        /// Kiểu chữ của gợi ý
        hintStyle: TextStyle(
          /// Màu chữ của gợi ý
          color: Colors.white.withOpacity(0.8),

          /// Kích thước chữ của gợi ý
          fontSize: 16,
        ),

        /// Hiển thị biểu tượng trước ô tìm kiếm
        prefixIcon: SizedBox(
          /// Chiều rộng của SizedBox
          width: 44,

          /// Center là một widget để căn giữa widget con theo chiều ngang và dọc
          child: Center(
            /// Hiển thị biểu tượng tìm kiếm
            child: Image.asset(
              /// Đường dẫn của hình ảnh
              AppIcons.search,

              /// Chiều rộng của hình ảnh
              width: 20,

              /// Chiều cao của hình ảnh
              height: 20,
            ),
          ),
        ),

        /// OutlineInputBorder là một lớp để tạo viền cho TextFormField
        border: OutlineInputBorder(
          /// Bo tròn các góc của viền
          borderRadius: BorderRadius.circular(12.0),
        ),

        /// Có nên tô màu nền cho TextFormField hay không
        filled: true,

        /// Màu nền của TextFormField
        fillColor: AppColors.hex181818,
      ),

      /// Hàm được gọi khi người dùng thay đổi nội dung tìm kiếm
      onChanged: widget.onChanged,
    );
  }
}
