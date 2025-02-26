import 'package:flutter/material.dart';

import 'calendar_item.dart';

/// Lịch tuần
class WeekCalendar extends StatelessWidget {
  const WeekCalendar({
    super.key,
    required this.dates,
    required this.selectedDate,
    required this.onDateSelected,
  });

  /// Ngày được chọn
  final DateTime? selectedDate;

  /// Danh sách ngày trong tuần
  final List<DateTime> dates;

  /// Sự kiện khi chọn ngày
  final ValueChanged<DateTime> onDateSelected;

  /// Xây dựng widget
  @override
  Widget build(BuildContext context) {
    /// GridView là một widget dùng để hiển thị các widget con theo dạng lưới
    return GridView.builder(
      /// Padding của GridView
      padding: EdgeInsets.zero,

      /// Thuộc tính này giúp cho GridView không bị scroll khi nó nằm trong ScrollView
      shrinkWrap: true,

      /// SliverGridDelegateWithFixedCrossAxisCount là một lớp để tạo ra một lưới với số cột cố định
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        /// Số cột của GridView
        crossAxisCount: 7,

        /// Khoảng cách giữa các cột
        mainAxisSpacing: 0,

        /// Khoảng cách giữa các hàng
        crossAxisSpacing: 0,

        /// Tỉ lệ giữa chiều rộng và chiều cao của mỗi item
        childAspectRatio: 58 / 70,
      ),

      /// Số lượng item của GridView
      itemCount: dates.length,

      /// Không cho phép scroll
      physics: const NeverScrollableScrollPhysics(),

      /// Xây dựng item của GridView
      itemBuilder: (context, index) {
        /// Trả về một widget CalendarItem
        return CalendarItem(
          /// Ngày
          date: dates[index],

          /// Kiểm tra xem ngày hiện tại có được chọn không
          isSelected: DateUtils.isSameDay(dates[index], selectedDate),

          /// Sự kiện khi chọn ngày
          onSelected: () {
            /// Gọi sự kiện onDateSelected
            onDateSelected.call(dates[index]);
          },
        );
      },
    );
  }
}
