import 'package:flutter/material.dart';
import 'package:homework/data/models/task_model.dart';
import 'package:homework/data/models/task_priority.dart';
import 'package:homework/data/models/task_status.dart';
import 'package:homework/screens/all_tasks/all_tasks_screen.dart';
import 'package:homework/screens/home/widgets/add_button.dart';
import 'package:homework/screens/home/widgets/header_item.dart';
import 'package:homework/screens/home/widgets/home_app_bar.dart';
import 'package:homework/screens/home/widgets/progress_item.dart';
import 'package:homework/screens/home/widgets/search_field.dart';
import 'package:homework/screens/home/widgets/task_item.dart';
import 'package:uuid/uuid.dart';
import '../../constants/app_colors.dart';
import '../all_tasks/models/all_tasks_screen_arguments.dart';
import '../new_task/models/new_task_screen_arguments.dart';
import '../new_task/new_task_screen.dart';

/// HomeScreen là một StatefulWidget để hiển thị màn hình chính
class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  /// Constructor của HomeScreen
  const HomeScreen({super.key});

  /// Hàm createState tạo ra một State mới cho widget
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/// _HomeScreenState là một State của HomeScreen
class _HomeScreenState extends State<HomeScreen> {
  /// Danh sách các công việc
  final tasks = <TaskModel>[
    TaskModel(
      id: const Uuid().v4(),
      name: 'Mobile App Research',
      description: 'Mobile App Research',
      startTime: const TimeOfDay(hour: 8, minute: 0),
      endTime: const TimeOfDay(hour: 9, minute: 0),
      date: DateTime.now(),
      priority: TaskPriority.high,
      taskStatus: TaskStatus.complete,
    ),
    TaskModel(
      id: const Uuid().v4(),
      name: 'Prepare Wireframe for Main Flow',
      description: 'Prepare Wireframe for Main Flow',
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      date: DateTime.now(),
      priority: TaskPriority.medium,
      taskStatus: TaskStatus.complete,
    ),
    TaskModel(
      id: const Uuid().v4(),
      name: 'Prepare Screens',
      description: 'Prepare Screens',
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      date: DateTime.now(),
      priority: TaskPriority.low,
      taskStatus: TaskStatus.incomplete,
    ),
    TaskModel(
      id: const Uuid().v4(),
      name: 'Mobile App Research',
      description: 'Mobile App Research',
      startTime: const TimeOfDay(hour: 8, minute: 0),
      endTime: const TimeOfDay(hour: 9, minute: 0),
      date: DateTime.now().add(const Duration(days: 1)),
      priority: TaskPriority.high,
      taskStatus: TaskStatus.complete,
    ),
    TaskModel(
      id: const Uuid().v4(),
      name: 'Prepare Wireframe for Main Flow',
      description: 'Prepare Wireframe for Main Flow',
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      date: DateTime.now().add(const Duration(days: 1)),
      priority: TaskPriority.medium,
      taskStatus: TaskStatus.complete,
    ),
    TaskModel(
      id: const Uuid().v4(),
      name: 'Prepare Screens',
      description: 'Prepare Screens',
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      date: DateTime.now().add(const Duration(days: 1)),
      priority: TaskPriority.low,
      taskStatus: TaskStatus.incomplete,
    ),
  ];

  /// Hàm build chứa nội dung của HomeScreen
  @override
  Widget build(BuildContext context) {
    /// Danh sách công việc trong ngày sử dụng hàm where để lọc các công việc trong ngày
    final todayTasks = tasks.where((task) {
      /// So sánh ngày của công việc với ngày hiện tại
      return DateUtils.isSameDay(
        task.date,
        DateTime.now(),
      );
    }).toList();

    /// Danh sách công việc trong ngày mai sử dụng hàm where để lọc các công việc trong ngày mai
    final tomorrowTasks = tasks.where((task) {
      /// So sánh ngày của công việc với ngày mai
      return DateUtils.isSameDay(
        task.date,
        DateTime.now().add(
          const Duration(days: 1),
        ),
      );
    }).toList();

    /// Số lượng công việc đã hoàn thành trong ngày
    final numberOfCompletedTodayTask = todayTasks.where((task) {
      /// Lọc các công việc đã hoàn thành
      return task.taskStatus == TaskStatus.complete;
    }).length;

    /// Dùng GestureDetector để đóng bàn phím khi nhấn vào màn hình
    return GestureDetector(
      onTap: () {
        /// Đóng bàn phím khi nhấn vào màn hình
        FocusScope.of(context).unfocus();
      },

      /// Scaffold là một widget để hiển thị màn hình chính của ứng dụng. Chứa AppBar, body và floatingActionButton
      child: Scaffold(
        /// Màu nền của Scaffold
        backgroundColor: AppColors.hex020206,

        /// AppBar của màn hình
        appBar: HomeAppBar(
          /// Hàm được gọi khi người dùng thay đổi nội dung tìm kiếm
          onSearchChanged: (value) {
            /// In ra nội dung tìm kiếm
            debugPrint("Search text changed: $value");
          },
        ),

        /// Nội dung của màn hình
        body: SafeArea(
          child: SingleChildScrollView(
            /// Widget con của SingleChildScrollView
            child: Column(
              /// Chứa các widget con theo chiều dọc
              children: [
                /// Thêm một khoảng cách xung quanh nút tìm kiếm
                Padding(
                  /// Khoảng cách giữa các widget con
                  padding: const EdgeInsets.symmetric(
                    /// Khoảng cách theo chiều dọc
                    vertical: 12,

                    /// Khoảng cách theo chiều ngang
                    horizontal: 20,
                  ),

                  /// SearchField là một widget hiển thị ô tìm kiếm
                  child: SearchField(
                    /// Gợi ý cho ô tìm kiếm
                    hintText: "Search Task Here",

                    /// Hàm được gọi khi người dùng thay đổi nội dung tìm kiếm
                    onChanged: (value) {
                      /// In ra nội dung tìm kiếm
                      debugPrint("Search text changed: $value");
                    },
                  ),
                ),

                /// Hiển thị tiêu đề
                HeaderItem(
                  title: 'Progress',
                  onSeeAllTap: () {
                    _navigateToAllTasksScreen();
                  },
                ),

                /// Hiển thị tiến độ công việc
                ProgressItem(
                  /// Số lượng công việc đã hoàn thành
                  numberOfCompletedTask: numberOfCompletedTodayTask,

                  /// Tổng số công việc
                  numberOfTasks: todayTasks.length,
                ),

                /// Hiển thị tiêu đề
                HeaderItem(
                  title: "Today's Task",
                  onSeeAllTap: () {
                    _navigateToAllTasksScreen();
                  },
                ),

                /// Danh sách công việc trong ngày
                ListView.builder(
                  /// Canh lề của ListView
                  padding: EdgeInsets.zero,

                  /// Vô hiệu hóa cuộn
                  physics: const NeverScrollableScrollPhysics(),

                  /// Hàm build một item của ListView
                  itemBuilder: (context, index) {
                    /// Trả về một TaskItem
                    return TaskItem(
                      /// Công việc hiện tại
                      taskModel: todayTasks[index],

                      /// Hàm được gọi khi người dùng thay đổi trạng thái công việc
                      onStatusChanged: (taskStatus) {
                        /// Tìm vị trí của công việc trong danh sách bằng id
                        final taskIndex = tasks.indexWhere(
                          (e) => e.id == todayTasks[index].id,
                        );

                        /// Cập nhật trạng thái công việc trong danh sách bằng trạng thái mới
                        setState(() {
                          tasks[taskIndex] = todayTasks[index]
                              .copyWith(taskStatus: taskStatus);
                        });
                      },
                      onTap: () {
                        _navigateToNewTaskScreen(
                          taskModel: todayTasks[index],
                        );
                      },
                    );
                  },

                  /// Số lượng item của ListView
                  itemCount: todayTasks.length,

                  /// Vô hiệu hóa cuộn
                  shrinkWrap: true,
                ),

                /// Hiển thị tiêu đề
                HeaderItem(
                  title: "Tomorrow Task",
                  onSeeAllTap: () {
                    _navigateToAllTasksScreen();
                  },
                ),

                /// Danh sách công việc trong ngày mai
                ListView.builder(
                  /// Canh lề của ListView
                  padding: EdgeInsets.zero,

                  /// Vô hiệu hóa cuộn
                  physics: const NeverScrollableScrollPhysics(),

                  /// Hàm build một item của ListView
                  itemBuilder: (context, index) {
                    /// Trả về một TaskItem
                    return TaskItem(
                      /// Công việc hiện tại
                      taskModel: tomorrowTasks[index],

                      /// Hàm được gọi khi người dùng thay đổi trạng thái công việc
                      onStatusChanged: (taskStatus) {
                        /// Tìm vị trí của công việc trong danh sách bằng id
                        final taskIndex = tasks.indexWhere(
                          (e) => e.id == tomorrowTasks[index].id,
                        );

                        /// Cập nhật trạng thái công việc trong danh sách bằng trạng thái mới
                        setState(() {
                          tasks[taskIndex] = tomorrowTasks[index]
                              .copyWith(taskStatus: taskStatus);
                        });
                      },
                      onTap: () {
                        _navigateToNewTaskScreen(
                          taskModel: tomorrowTasks[index],
                        );
                      },
                    );
                  },

                  /// Số lượng item của ListView
                  itemCount: tomorrowTasks.length,

                  /// Vô hiệu hóa cuộn
                  shrinkWrap: true,
                ),

                /// Khoảng cách giữa các widget con
                const SizedBox(
                  /// Khoảng cách theo chiều dọc
                  height: 100,
                ),
              ],
            ),
          ),
        ),

        /// Nút thêm công việc
        floatingActionButton: AddButton(
          /// Hàm được gọi khi người dùng nhấn vào nút
          onTap: () async {
            _navigateToNewTaskScreen();
          },
        ),

        /// Vị trí của nút thêm công việc
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  /// Điều hướng đến màn hình tất cả công việc
  Future<void> _navigateToAllTasksScreen() async {
    /// Sử dụng hàm pushNamed để điều hướng tới
    /// màn hình tất cả công việc
    await Navigator.of(context).pushNamed(
      /// Đường dẫn của màn hình tất cả công việc
      AllTasksScreen.routeName,

      /// Tham số truyền vào màn hình tất cả công việc
      arguments: AllTasksScreenArguments(
        tasks: tasks,
      ),
    );
  }

  /// Điều hướng đến màn hình tạo công việc mới
  /// - Nếu taskModel == null thì mang nghĩa là tạo công việc mới
  /// - Nếu taskModel != null thì mang nghĩa là chỉnh sửa công việc
  Future<void> _navigateToNewTaskScreen({TaskModel? taskModel}) async {
    /// Sử dụng hàm pushNamed để điều hướng tới
    /// màn hình tạo công việc mới
    final newTaskModel = await Navigator.of(context).pushNamed(
      /// Đường dẫn của màn hình tạo công việc mới
      NewTaskScreen.routeName,

      /// Tham số truuyền vào màn hình tạo công việc mới
      arguments: NewTaskScreenArguments(
        taskModel: taskModel,
      ),
    ) as TaskModel?;

    /// Nếu không có công việc mới
    if (newTaskModel == null) {
      return;
    }

    setState(() {
      if (taskModel != null) {
        /// Nếu taskModel != null thì cập nhật công việc
        final taskIndex = tasks.indexWhere((e) => e.id == taskModel.id);
        tasks[taskIndex] = newTaskModel;
      } else {
        /// Nếu taskModel == null thì thêm công việc mới
        tasks.add(newTaskModel);
      }
    });
  }
}
