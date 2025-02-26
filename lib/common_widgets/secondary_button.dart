import 'package:flutter/material.dart';

/// SecondaryButton là một nút tùy chỉnh
class SecondaryButton extends StatelessWidget {
  /// Constructor của SecondaryButton
  const SecondaryButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.color,
    required this.onTap,
  });

  /// Tiêu đề của nút
  final String title;

  /// Trạng thái chọn của nút
  final bool isSelected;

  /// Màu của nút
  final Color color;

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
        height: 40,

        /// Định dạng của nút
        decoration: BoxDecoration(
          /// Màu nền của nút
          color: isSelected ? color : Colors.transparent,

          /// Bo tròn mép của nút
          borderRadius: const BorderRadius.all(Radius.circular(8)),

          /// Viền của nút
          border: Border.all(
            /// Độ rộng của viền
            width: isSelected ? 0 : 2,

            /// Màu của viền
            color: color,
          ),
        ),

        /// Nội dung của nút
        child: Center(
          /// Canh giữa nội dung của nút
          child: Text(
            /// Tiêu đề của nút
            title,

            /// Kiểu chữ của tiêu đề
            style: TextStyle(
              /// Màu chữ của tiêu đề
              color: isSelected ? Colors.black : Colors.white,

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
