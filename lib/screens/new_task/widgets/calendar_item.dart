import 'package:flutter/material.dart';
import 'package:homework/extensions/date_time_extensions.dart';

import '../../../constants/app_colors.dart';

/// Widget hiển thị một ngày trong tuần
class CalendarItem extends StatelessWidget {
  const CalendarItem({
    super.key,
    required this.date,
    required this.isSelected,
    required this.onSelected,
  });

  /// Ngày đuược chọn
  final bool isSelected;

  /// Ngày
  final DateTime date;

  /// Sự kiện khi chọn ngày
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    /// GestureDetector là một widget dùng để bắt sự kiện khi người dùng chạm vào widget con của nó
    return GestureDetector(
      /// Sự kiện khi người dùng chạm vào widget
      onTap: () {
        /// Gọi sự kiện onSelected
        onSelected.call();
      },

      /// Thuộc tính này giúp cho GestureDetector không bị ảnh hưởng bởi các sự kiện chạm vào các widget con của nó
      behavior: HitTestBehavior.translucent,

      /// Stack là một widget dùng để xếp các widget con lên nhau
      child: Stack(
        /// StackFit.expand là một giá trị của thuộc tính fit của Stack, nó giúp cho các widget con của Stack mở rộng ra toàn bộ không gian của Stack
        fit: StackFit.expand,

        /// Căn chỉnh các widget con của Stack
        alignment: Alignment.bottomCenter,

        /// Danh sách các widget con của Stack
        children: [
          /// Positioned là một widget dùng để căn chỉnh vị trí của widget con của nó
          Positioned(
            /// Thuộc tính left, right, top, bottom giúp cho widget con của Positioned được căn chỉnh vị trí
            top: 0,
            right: 0,
            left: 0,
            bottom: 3,

            /// Container là một widget dùng để tạo hình dạng, màu sắc, hoặc hiệu ứng cho widget con của nó
            child: Container(
              /// Decoration là một lớp để tạo hình dạng, màu sắc, hoặc hiệu ứng cho container
              decoration: BoxDecoration(
                /// Bo tròn các góc của container
                borderRadius: BorderRadius.circular(10),

                /// Border là một lớp để tạo viền cho container
                border: Border.all(
                  /// Màu viền của container
                  color: isSelected ? AppColors.hexBA83DE : Colors.transparent,

                  /// Độ dày của viền
                  width: 2,
                ),
              ),

              /// Column là một widget dùng để xếp các widget con của nó theo chiều dọc
              child: Column(
                /// Căn chỉnh các widget con của Column
                mainAxisAlignment: MainAxisAlignment.center,

                /// Danh sách các widget con của Column
                children: [
                  /// Hiển thị thứ trong tuần
                  Text(
                    /// Hiển thị thứ trong tuần
                    date.displayWeekdayString(),

                    /// TextStyle là một lớp để tạo kiểu cho text
                    style: TextStyle(
                      /// Kích thước của text
                      fontSize: 15,

                      /// Màu của text
                      color: isSelected
                          ? Colors.white
                          : Colors.white.withOpacity(0.6),

                      /// Độ đậm của text
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  /// Khoảng cách giữa các widget con
                  const SizedBox(
                    /// Khoảng cách theo chiều dọc
                    height: 6,
                  ),

                  /// Hiển thị ngày
                  Text(
                    /// Hiển thị ngày
                    date.displayDayString(),

                    /// TextStyle là một lớp để tạo kiểu cho text
                    style: TextStyle(
                      /// Kích thước của text
                      fontSize: 15,

                      /// Màu của text
                      color: isSelected
                          ? Colors.white
                          : Colors.white.withOpacity(0.6),

                      /// Độ đậm của text
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Nếu ngày được chọn thì hiển thị một hình tròn màu tím ở dưới cùng
          if (isSelected)

            /// Positioned là một widget dùng để căn chỉnh vị trí của widget con của nó
            Positioned(
              /// Thuộc tính bottom giúp cho widget con của Positioned được căn chỉnh vị trí
              bottom: 0,

              /// Container là một widget dùng để tạo hình dạng, màu sắc, hoặc hiệu ứng cho widget con của nó
              child: Container(
                /// Chiều rộng của container
                width: 8,

                /// Chiều cao của container
                height: 8,

                ///  Decoration là một lớp để tạo hình dạng, màu sắc, hoặc hiệu ứng cho container
                decoration: BoxDecoration(
                  /// Màu của container
                  color: AppColors.hexBA83DE,

                  /// Bo tròn các góc của container
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
