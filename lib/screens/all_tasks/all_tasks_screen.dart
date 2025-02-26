import 'package:flutter/material.dart';
import 'package:homework/common_widgets/primary_app_bar.dart';
import 'package:homework/screens/home/widgets/task_item.dart';

import '../../constants/app_colors.dart';
import '../../data/models/task_model.dart';
import 'models/all_tasks_screen_arguments.dart';

/// Màn hình hiển thị tất cả công việc
class AllTasksScreen extends StatefulWidget {
  static const routeName = '/all-tasks';

  const AllTasksScreen({
    required this.arguments,
    super.key,
  });

  final AllTasksScreenArguments arguments;

  @override
  State<AllTasksScreen> createState() => _AllTasksScreenState();
}

class _AllTasksScreenState extends State<AllTasksScreen> {
  late List<TaskModel> allTasks;

  @override
  void initState() {
    super.initState();
    allTasks = widget.arguments.tasks;
  }

  @override
  Widget build(BuildContext context) {
    /// Danh sách công việc trong ngày sử dụng hàm where để lọc các công việc trong ngày
    final todayTasks = allTasks.where((task) {
      /// So sánh ngày của công việc với ngày hiện tại
      return DateUtils.isSameDay(
        task.date,
        DateTime.now(),
      );
    }).toList();

    /// Danh sách công việc trong ngày mai sử dụng hàm where để lọc các công việc trong ngày mai
    final tomorrowTasks = allTasks.where((task) {
      /// So sánh ngày của công việc với ngày mai
      return DateUtils.isSameDay(
        task.date,
        DateTime.now().add(
          const Duration(days: 1),
        ),
      );
    }).toList();

    /// DefaultTabController là một widget dùng để tạo ra một TabController mặc định cho TabBar và TabBarView
    return DefaultTabController(
      /// Số lượng tab
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.hex020206,
        appBar: PrimaryAppBar(
          title: 'All Tasks',
          onBack: () {
            Navigator.of(context).pop();
          },
        ),
        body: Column(
          children: [
            /// TabBar là một widget dùng để hiển thị các tab
            const TabBar(
              /// Màu của tab được chọn
              indicatorColor: AppColors.hexDE83B0,

              /// Độ dày của tab được chọn
              indicatorWeight: 2,

              /// Kích thước của tab được chọn
              indicatorSize: TabBarIndicatorSize.tab,

              /// Màu chữ của tab
              labelColor: AppColors.hexDE83B0,

              /// Kiểu chữ của tab
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),

              /// Danh sách các tab
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'Today'),
                Tab(text: 'Tomorrow'),
              ],
            ),
            Expanded(
              /// TabBarView là một widget dùng để hiển thị nội dung của các tab
              child: TabBarView(
                children: [
                  /// Hiển thị tất cả công việc
                  _buildTabBarContentView(tasks: allTasks),

                  /// Hiển thị công việc trong ngày
                  _buildTabBarContentView(tasks: todayTasks),

                  /// Hiển thị công việc trong ngày mai
                  _buildTabBarContentView(tasks: tomorrowTasks),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Hàm build chứa nội dung của TabBarView
  Widget _buildTabBarContentView({
    required List<TaskModel> tasks,
  }) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) {
        return TaskItem(
          taskModel: tasks[index],
          onStatusChanged: (taskStatus) {},
          onTap: () {},
        );
      },
      itemCount: tasks.length,
    );
  }
}
