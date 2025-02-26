import 'package:flutter/material.dart';
import 'package:homework/extensions/time_of_day_extensions.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icons.dart';

/// TimePicker là một StatefulWidget để hiển thị ô chọn thời gian
class TimePicker extends StatefulWidget {
  const TimePicker({
    super.key,
    required this.title,
    required this.time,
    required this.onTimeChanged,
  });

  /// Tiêu đề của TimePicker
  final String title;

  /// Thời gian ban đầu của TimePicker
  final TimeOfDay time;

  /// Hàm được gọi khi người dùng thay đổi thời gian
  final ValueChanged<TimeOfDay> onTimeChanged;

  /// Hàm createState tạo ra một State mới cho widget
  @override
  State<TimePicker> createState() => _TimePickerState();
}

/// _TimePickerState là một State của TimePicker
class _TimePickerState extends State<TimePicker> {
  /// TextEditingController để quản lý nội dung của ô nhập
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.time.formatTimeOfDay();
  }

  /// Hàm build chứa nội dung của TimePicker
  @override
  Widget build(BuildContext context) {
    /// Column là một widget để sắp xếp các widget con theo chiều dọc
    return Column(
      /// Canh lề của cột
      crossAxisAlignment: CrossAxisAlignment.start,

      /// Danh sách các widget con của cột
      children: [
        /// Hiển thị tiêu đề
        Text(
          /// Tiêu đề của TimePicker
          widget.title,

          /// Kiểu chữ của tiêu đề
          style: TextStyle(
            /// Màu chữ của tiêu đề
            color: Colors.white.withOpacity(0.8),

            /// Kích thước chữ của tiêu đề
            fontSize: 20,
          ),
        ),

        /// Khoảng cách giữa các widget con
        const SizedBox(
          /// Khoảng cách theo chiều dọc
          height: 8,
        ),

        /// Hiển thị ô chọn thời gian
        TextFormField(
          controller: controller,

          /// Kiểu chữ của TextFormField
          style: const TextStyle(
            /// Màu chữ của TextFormField
            color: Colors.white,

            /// Kích thước chữ của TextFormField
            fontSize: 16,
          ),

          /// Cho phép người dùng chỉ đọc ô nhập hay không
          readOnly: true,

          /// Hàm được gọi khi người dùng nhấn vào ô nhập
          onTap: () async {
            /// Hiển thị bảng chọn thời gian
            final selectedTime = await showTimePicker(
              /// Thời gian ban đầu của bảng chọn thời gian
              initialTime: widget.time,

              /// Context của bảng chọn thời gian
              context: context,

              /// Builder của bảng chọn thời gian
              builder: (BuildContext context, Widget? child) {
                /// Trả về một Theme chứa bảng chọn thời gian
                return Theme(
                  /// Theme là một widget để cung cấp dữ liệu cho các widget con
                  data: Theme.of(context).copyWith(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),

                  /// MediaQuery là một widget để cung cấp thông tin về màn hình
                  child: MediaQuery(
                    /// MediaQueryData là một lớp chứa thông tin về màn hình
                    data: MediaQuery.of(context).copyWith(
                      /// Có nên sử dụng định dạng 24 giờ hay không
                      alwaysUse24HourFormat: false,
                    ),

                    /// child là widget con của MediaQuery
                    child: child!,
                  ),
                );
              },
            );

            /// Nếu người dùng chọn thời gian
            if (selectedTime != null) {
              /// Gọi hàm onTimeChanged với tham số là thời gian được chọn
              widget.onTimeChanged.call(selectedTime);

              /// Cập nhật thời gian hiển thị trên ô nhập
              controller.text = selectedTime.formatTimeOfDay();
            }
          },

          /// InputDecoration là một lớp để tùy chỉnh hình dạng và hiển thị của TextFormField
          decoration: InputDecoration(
            /// Kiểu chữ của gợi ý
            hintStyle: TextStyle(
              /// Màu chữ của gợi ý
              color: Colors.white.withOpacity(0.8),

              /// Kích thước chữ của gợi ý
              fontSize: 16,
            ),

            /// Hiển thị biểu tượng trước ô nhập
            prefixIcon: SizedBox(
              /// Chiều rộng của SizedBox
              width: 44,

              /// Canh giữa nội dung của SizedBox
              child: Center(
                /// Hiển thị hình ảnh từ asset
                child: Image.asset(
                  /// Đường dẫn của hình ảnh
                  AppIcons.clock,

                  /// Chiều rộng của hình ảnh
                  width: 24,

                  /// Chiều cao của hình ảnh
                  height: 24,
                ),
              ),
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
        )
      ],
    );
  }
}
