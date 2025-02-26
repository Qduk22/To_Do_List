import 'package:flutter/material.dart';
import 'package:homework/extensions/date_time_extensions.dart';
import 'package:homework/screens/demo/models/todo_model.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icons.dart';

class TodoItemWidget extends StatelessWidget {
  const TodoItemWidget({
    required this.todoModel,
    required this.onStatusChanged,
    required this.onTap,
    super.key,
  });

  final TodoModel todoModel;

  final ValueChanged<bool> onStatusChanged;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.hex181818,
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 14,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    todoModel.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    todoModel.description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AppIcons.calendar,
                        width: 15,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        todoModel.createdAt
                            .displayDateString(format: 'HH:mm, dd MMM yyyy'),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                onStatusChanged(!todoModel.isCompleted);
              },
              behavior: HitTestBehavior.translucent,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  todoModel.isCompleted ? AppIcons.check : AppIcons.uncheck,
                  width: 26,
                  height: 26,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
