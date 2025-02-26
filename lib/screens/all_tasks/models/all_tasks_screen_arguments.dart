import '../../../data/models/task_model.dart';

/// Khai báo tham số cho màn hình AllTasksScreen
class AllTasksScreenArguments {
  /// Danh sách công việc
  final List<TaskModel> tasks;

  const AllTasksScreenArguments({
    required this.tasks,
  });
}
