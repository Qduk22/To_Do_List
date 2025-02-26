import 'package:flutter/material.dart';
import 'package:homework/constants/app_colors.dart';

/// SearchField là một StefulWidget để hiển thị ô tìm kiếm
class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.maxLines,
    required this.initialValue,
  });

  /// Gợi ý cho ô nhập
  final String hintText;

  /// Hàm được gọi khi người dùng thay đổi nội dung
  final ValueChanged<String> onChanged;

  /// Số dòng tối đa của TextFormField
  final int maxLines;

  final String? initialValue;

  /// Hàm createState tạo ra một State mới cho widget
  @override
  State<InputField> createState() => _InputFieldState();
}

/// _InputFieldState là một State của InputField
class _InputFieldState extends State<InputField> {
  /// TextEditingController để quản lý nội dung của ô tìm kiếm
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  /// Hàm build chứa nội dung của InputField
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

      /// Số dòng tối đa của TextFormField
      maxLines: widget.maxLines,

      /// InputDecoration là một lớp để tùy chỉnh hình dạng và hiển thị của TextFormField
      decoration: InputDecoration(
        /// Gợi ý cho ô nhập
        hintText: widget.hintText,

        /// Kiểu chữ của gợi ý
        hintStyle: TextStyle(
          /// Màu chữ của gợi ý
          color: Colors.white.withOpacity(0.8),

          /// Kích thước chữ của gợi ý
          fontSize: 16,
        ),

        /// SizedBox là một widget để cung cấp một hộp chứa tùy chỉnh
        border: OutlineInputBorder(
          /// Bo tròn các góc của viền
          borderRadius: BorderRadius.circular(12.0),
        ),

        /// Có nên tô màu nền cho TextFormField hay không
        filled: true,

        /// Màu nền của TextFormField
        fillColor: AppColors.hex181818,
      ),

      /// Hàm được gọi khi người dùng thay đổi nội dung
      onChanged: widget.onChanged,
    );
  }
}
