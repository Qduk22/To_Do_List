import 'package:flutter/material.dart';
import 'package:homework/extensions/date_time_extensions.dart';
import 'package:homework/screens/new_task/widgets/week_calendar.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icons.dart';

/// Widget chọn ngày
class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
    required this.date,
    required this.selectedDate,
    required this.onDateChanged,
  });

  /// Ngày hiện tại
  final DateTime date;

  /// Ngày được chọn
  final DateTime selectedDate;

  /// Sự kiện khi chọn ngày
  final ValueChanged<DateTime> onDateChanged;

  /// Xây dựng state của widget
  @override
  State<DatePicker> createState() => _DatePickerState();
}

/// State của DatePicker
class _DatePickerState extends State<DatePicker> {
  /// Ngày hiện tại
  DateTime _date = DateTime.now();

  /// Hiển thị danh sách các ngày cho PageView
  List<DateTime> _dates = [];

  /// Ngày được chọn
  DateTime? _selectedDate;

  /// Trang khởi tạo cho PageView
  final _initialPage = 520;

  /// PageController để điều khiển PageView
  late PageController _pageController;

  /// Trang hiện tại của PageView
  late int _currentPage;

  /// Khởi tạo state
  @override
  void initState() {
    super.initState();

    /// Khởi tạo PageController
    _pageController = PageController(initialPage: _initialPage);

    /// Gán giá trị cho _date, _dates, _currentPage, _selectedDate
    _date = widget.date;
    _dates = [_date.previousWeek, _date, _date.nextWeek];
    _currentPage = _initialPage;
    _selectedDate = widget.selectedDate;
  }

  /// Xây dựng widget
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Khoảng cách giữa các widget con
        const SizedBox(
          /// Khoảng cách theo chiều dọc
          height: 16,
        ),

        /// Row là một widget dùng để xếp các widget con theo chiều ngang
        Row(
          /// Căn chỉnh các widget con của Row
          children: [
            /// GestureDetector là một widget dùng để bắt sự kiện khi người dùng chạm vào widget con của nó
            GestureDetector(
              /// Thuộc tính này giúp cho GestureDetector không bị ảnh hưởng bởi các sự kiện chạm vào các widget con của nó
              behavior: HitTestBehavior.translucent,

              /// Sự kiện khi người dùng chạm vào widget
              onTap: () {
                /// Gọi hàm setState để cập nhật lại giao diện
                setState(() {
                  /// Giảm giá trị của _currentPage đi 1
                  _currentPage--;

                  /// Di chuyển PageView đến trang _currentPage
                  _pageController.animateToPage(
                    /// Trang hiện tại
                    _currentPage,

                    /// Thời gian di chuyển
                    duration: const Duration(milliseconds: 300),

                    /// Kiểu di chuyển
                    curve: Curves.easeInOut,
                  );
                });
              },

              /// Container là một widget dùng để tạo hình dạng, màu sắc, hoặc hiệu ứng cho widget con của nó
              child: SizedBox(
                /// Chiều cao của Container
                height: 44,

                /// Chiều rộng của Container
                width: 44,

                /// Center là một widget dùng để căn chỉnh widget con của nó vào giữa
                child: Center(
                  /// Image.asset là một widget dùng để hiển thị ảnh từ asset
                  child: Image.asset(
                    /// Đường dẫn của ảnh
                    AppIcons.leftArrow,

                    /// Chiều cao của ảnh
                    height: 17,
                  ),
                ),
              ),
            ),

            /// Expanded là một widget dùng để mở rộng widget con của nó theo chiều ngang
            Expanded(
              /// Center là một widget dùng để căn chỉnh widget con của nó vào giữa
              child: Text(
                /// Hiển thị ngày dưới dạng chuỗi
                '${_date.startOfWeek.displayDateString()} - ${_date.endOfWeek.displayDateString()}',

                /// TextStyle là một lớp để thiết lập kiểu dáng cho text
                style: const TextStyle(
                  /// Kích thước của text
                  fontSize: 20,

                  /// Màu của text
                  color: AppColors.hexBA83DE,
                ),

                /// Căn chỉnh text
                textAlign: TextAlign.center,
              ),
            ),

            /// GestureDetector là một widget dùng để bắt sự kiện khi người dùng chạm vào widget con của nó
            GestureDetector(
              /// Thuộc tính này giúp cho GestureDetector không bị ảnh hưởng bởi các sự kiện chạm vào các widget con của nó
              behavior: HitTestBehavior.translucent,

              /// Sự kiện khi người dùng chạm vào widget
              onTap: () {
                /// Gọi hàm setState để cập nhật lại giao diện
                setState(() {
                  /// Tăng giá trị của _currentPage lên 1
                  _currentPage++;

                  /// Di chuyển PageView đến trang _currentPage
                  _pageController.animateToPage(
                    /// Trang hiện tại
                    _currentPage,

                    /// Thời gian di chuyển
                    duration: const Duration(milliseconds: 300),

                    /// Kiểu di chuyển
                    curve: Curves.easeInOut,
                  );
                });
              },

              /// SizedBox là một widget dùng để tạo một hộp có kích thước cố định
              child: SizedBox(
                /// Chiều cao của SizedBox
                height: 44,

                /// Chiều rộng của SizedBox
                width: 44,

                /// Center là một widget dùng để căn chỉnh widget con của nó vào giữa
                child: Center(
                  /// Image.asset là một widget dùng để hiển thị ảnh từ asset
                  child: Image.asset(
                    /// Đường dẫn của ảnh
                    AppIcons.rightArrow,

                    /// Chiều cao của ảnh
                    height: 17,
                  ),
                ),
              ),
            )
          ],
        ),

        /// Khoảng cách giữa các widget con
        const SizedBox(
          /// Khoảng cách theo chiều dọc
          height: 32,
        ),

        ///
        SizedBox(
          /// Chiều cao của PageView
          height: ((MediaQuery.of(context).size.width - 6 * 2) / 7) / (58 / 70),

          /// PageView là một widget dùng để hiển thị các widget con theo dạng trang
          child: PageView.builder(
            /// Controller của PageView
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              /// WeekCalendar là một widget dùng để hiển thị các ngày trong tuần
              return WeekCalendar(
                /// Danh sách ngày trong tuần
                dates: _dates[index % _dates.length].daysPerWeek,

                /// Ngày được chọn
                selectedDate: _selectedDate,

                /// Sự kiện khi chọn ngày
                onDateSelected: (date) {
                  /// Set giá trị cho _selectedDate
                  setState(() {
                    _selectedDate = date;
                    widget.onDateChanged.call(date);
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }

  /// Hàm được gọi khi thay đổi trang của PageView
  void _onPageChanged(int index) {
    /// Tính vị trí của page trong mảng _dates
    final page = index % _dates.length;

    /// Nếu page = 0
    if (page == 0) {
      setState(() {
        /// Gán giá trị của phần tử đầu tiên của _dates cho _date
        _date = _dates[0];

        /// Gán ngày của tuần trước cho phần tử thứ 2 của _dates
        _dates[2] = _date.previousWeek;

        /// Gán ngày của tuần sau cho phần tử thứ 1 của _dates
        _dates[1] = _date.nextWeek;

        /// Gán giá trị của _currentPage
        _currentPage = index;
      });

      /// Nếu page = 2
    } else if (page == 2) {
      setState(() {
        /// Gán giá trị của phần tử thứ 2 của _dates cho _date
        _date = _dates[2];

        /// Gán ngày của tuần sau cho phần tử đầu tiên của _dates
        _dates[0] = _date.nextWeek;

        /// Gán ngày của tuần trước cho phần tử thứ 1 của _dates
        _dates[1] = _date.previousWeek;

        /// Gán giá trị của _currentPage
        _currentPage = index;
      });

      /// Nếu page = 1
    } else if (page == 1) {
      setState(() {
        /// Gán giá trị của phần tử thứ 1 của _dates cho _date
        _date = _dates[1];

        /// Gán ngày của tuần trước cho phần tử đầu tiên của _dates
        _dates[0] = _date.previousWeek;

        /// Gán ngày của tuần sau cho phần tử thứ 2 của _dates
        _dates[2] = _date.nextWeek;

        /// Gán giá trị của _currentPage
        _currentPage = index;
      });
    }
  }
}
