import 'package:flutter/material.dart';
import 'package:homework/common_widgets/primary_app_bar.dart';
import 'package:homework/common_widgets/primary_button.dart';
import 'package:homework/data/models/task_model.dart';
import 'package:homework/data/models/task_priority.dart';
import 'package:homework/data/models/task_status.dart';
import 'package:homework/extensions/time_of_day_extensions.dart';
import 'package:homework/screens/new_task/models/new_task_screen_arguments.dart';
import 'package:homework/screens/new_task/widgets/date_picker.dart';
import 'package:homework/screens/new_task/widgets/input_field.dart';
import 'package:homework/screens/new_task/widgets/priority_item.dart';
import 'package:homework/screens/new_task/widgets/time_picker.dart';
import 'package:uuid/uuid.dart';

import '../../constants/app_colors.dart';

/// NewTaskScreen là một StatefulWidget để hiển thị màn hình tạo công việc mới
class NewTaskScreen extends StatefulWidget {
  static const routeName = '/new-task';

  /// Constructor của NewTaskScreen
  const NewTaskScreen({
    required this.arguments,
    super.key,
  });

  final NewTaskScreenArguments arguments;

  /// Hàm createState tạo ra một State mới cho widget
  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

/// _NewTaskScreenState là một State của NewTaskScreen
class _NewTaskScreenState extends State<NewTaskScreen> {
  /// Mức ưu tiên được chọn
  TaskPriority? selectedTaskPriority;

  /// Ngày được chọn
  late DateTime selectedDate;

  /// Thời gian bắt đầu công việc
  late TimeOfDay startTime;

  /// Thời gian kết thúc công việc
  late TimeOfDay endTime;

  /// Tên công việc
  String? name;

  /// Mô tả công việc
  String? description;

  /// Kiểm tra xem đây có phải là chế độ chỉnh sửa công việc không
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();

    /// Lấy danh sách công việc từ tham số truyền vào
    final taskModel = widget.arguments.taskModel;
    if (taskModel != null) {
      /// Cập nhật thông tin công việc cần chỉnh sửa
      selectedDate = taskModel.date;
      startTime = taskModel.startTime;
      endTime = taskModel.endTime;
      name = taskModel.name;
      description = taskModel.description;
      selectedTaskPriority = taskModel.priority;
      _isEditing = true;
    } else {
      /// Cài đặt thông tin mặc định cho công việc mới
      selectedDate = DateTime.now();
      startTime = TimeOfDay.now();
      endTime = startTime.replacing(hour: startTime.hour + 1);
    }
  }

  /// Hàm build chứa nội dung của NewTaskScreen
  @override
  Widget build(BuildContext context) {
    /// Dùng GestureDetector để bắt sự kiện khi người dùng chạm vào màn hình
    return GestureDetector(
      onTap: () {
        /// Ẩn bàn phím khi người dùng chạm vào bất kỳ vị trí nào trên màn hình
        FocusScope.of(context).unfocus();
      },

      /// Trả về một Scaffold chứa nội dung của NewTaskScreen và AppBar
      child: Scaffold(
        /// Màu nền của Scaffold
        backgroundColor: AppColors.hex020206,

        /// AppBar của màn hình
        appBar: PrimaryAppBar(
          /// Tiêu đề của AppBar
          title: _isEditing ? 'Edit Task' : 'Create New Task',

          /// Hàm được gọi khi người dùng nhấn nút back
          onBack: () {
            /// Đóng màn hình tạo công việc mới
            Navigator.of(context).pop();
          },
        ),

        /// Nội dung của màn hình
        body: SingleChildScrollView(
          /// Widget con của SingleChildScrollView
          child: Padding(
            /// Khoảng cách giữa các widget con
            padding: const EdgeInsets.symmetric(horizontal: 6),

            /// Widget con của Padding
            child: Column(
              /// Canh lề của các widget con theo chiều ngang
              crossAxisAlignment: CrossAxisAlignment.start,

              /// Danh sách các widget con của Column
              children: [
                DatePicker(
                  date: selectedDate,
                  selectedDate: selectedDate,
                  onDateChanged: (date) {
                    /// Cập nhật ngày được chọn
                    setState(() {
                      selectedDate = date;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Khoảng cách giữa các widget con
                      const SizedBox(
                        /// Khoảng cách theo chiều dọc
                        height: 24,
                      ),

                      /// Tiêu đề
                      const Text(
                        /// Hiển thị một đoạn văn bản
                        "Schedule",

                        /// Style của tiêu đề
                        style: TextStyle(
                          /// Kiểu chữ của tiêu đề
                          color: Colors.white,

                          /// Màu chữ của tiêu đề
                          fontSize: 22,
                        ),
                      ),

                      /// Khoảng cách giữa các widget con
                      const SizedBox(
                        /// Khoảng cách theo chiều dọc
                        height: 16,
                      ),

                      /// InputField nhập tên công việc
                      InputField(
                        initialValue: name,
                        hintText: "Name",
                        maxLines: 1,
                        onChanged: (value) {
                          /// Cập nhật tên công việc
                          setState(() {
                            name = value;
                          });
                        },
                      ),

                      /// Khoảng cách giữa các widget con
                      const SizedBox(
                        /// Khoảng cách theo chiều dọc
                        height: 16,
                      ),

                      /// InputField nhập mô tả công việc
                      InputField(
                        hintText: "Description",
                        initialValue: description,
                        maxLines: 4,
                        onChanged: (value) {
                          /// Cập nhật mô tả công việc
                          setState(() {
                            description = value;
                          });
                        },
                      ),

                      /// Khoảng cách giữa các widget con
                      const SizedBox(
                        /// Khoảng cách theo chiều dọc
                        height: 16,
                      ),

                      /// Hiển thị thời gian bắt đầu và kết thúc công việc
                      Row(
                        /// Canh lề của các widget con theo chiều ngang
                        children: [
                          /// Mở rộng widget con theo chiều ngang
                          Expanded(
                            /// Hiển thị ô chọn thời gian
                            child: TimePicker(
                              /// Tiêu đề của TimePicker
                              title: 'Start Time',

                              /// Hàm được gọi khi người dùng thay đổi thời gian
                              onTimeChanged: (time) {
                                /// Cập nhật thời gian bắt đầu công việc
                                setState(() {
                                  startTime = time;
                                });
                              },

                              /// Thời gian ban đầu của TimePicker
                              time: startTime,
                            ),
                          ),

                          /// Khoảng cách giữa các widget con
                          const SizedBox(
                            /// Khoảng cách theo chiều ngang
                            width: 11,
                          ),

                          /// Mở rộng widget con theo chiều ngang
                          Expanded(
                            /// Hiển thị ô chọn thời gian
                            child: TimePicker(
                              /// Thời gian ban đầu của TimePicker
                              time: endTime,

                              /// Tiêu đề của TimePicker
                              title: 'End Time',

                              /// Hàm được gọi khi người dùng thay đổi thời gian
                              onTimeChanged: (time) {
                                /// Cập nhật thời gian kết thúc công việc
                                setState(() {
                                  endTime = time;
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      /// Khoảng cách giữa các widget con
                      const SizedBox(
                        /// Khoảng cách theo chiều dọc
                        height: 16,
                      ),

                      /// PriorityItem chọn mức ưu tiên của công việc
                      PriorityItem(
                        /// Mức ưu tiên được chọn
                        selectedTaskPriority: selectedTaskPriority,

                        /// Danh sách các mức ưu tiên
                        taskPriorities: TaskPriority.values,

                        /// Hàm được gọi khi người dùng thay đổi mức ưu tiên
                        onTaskPriorityChanged: (taskPriority) {
                          /// Cập nhật mức ưu tiên được chọn
                          setState(() {
                            selectedTaskPriority = taskPriority;
                          });
                        },
                      ),

                      /// Khoảng cách giữa các widget con
                      const SizedBox(
                        /// Khoảng cách theo chiều dọc
                        height: 16,
                      ),

                      /// Nút tạo công việc
                      PrimaryButton(
                        /// Tiêu đề của nút
                        title: _isEditing ? 'Edit Task' : 'Create Task',

                        /// Hàm được gọi khi người dùng nhấn vào nút
                        onTap: () {
                          debugPrint('=====================');
                          debugPrint('Date: $selectedDate');
                          debugPrint('Name: $name');
                          debugPrint('Description: $description');
                          debugPrint(
                              'Start Time: ${startTime.formatTimeOfDay()}');
                          debugPrint('End Time: ${endTime.formatTimeOfDay()}');
                          debugPrint('Priority: $selectedTaskPriority');

                          /// Đóng màn hình tạo công việc mới
                          final newTaskModel = TaskModel(
                            id: const Uuid().v4(),
                            name: name ?? '',
                            description: description ?? '',
                            startTime: startTime,
                            endTime: endTime,
                            date: selectedDate,
                            priority:
                                selectedTaskPriority ?? TaskPriority.medium,
                            taskStatus: TaskStatus.incomplete,
                          );
                          Navigator.of(context).pop(newTaskModel);
                        },
                      ),

                      /// Khoảng cách giữa các widget con
                      const SizedBox(
                        /// Khoảng cách theo chiều dọc
                        height: 16,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
