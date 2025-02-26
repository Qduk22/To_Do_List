import 'package:flutter/material.dart';
import 'package:homework/screens/demo/services/todo_service.dart';
import 'package:homework/screens/demo/widgets/delete_button.dart';

import '../../common_widgets/primary_app_bar.dart';
import '../../common_widgets/primary_button.dart';
import '../../constants/app_colors.dart';
import '../new_task/widgets/input_field.dart';
import 'models/todo_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    required this.todoModel,
    super.key,
  });

  final TodoModel? todoModel;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String? title;

  String? description;

  String? error;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.todoModel != null) {
      title = widget.todoModel!.title;
      description = widget.todoModel!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.hex020206,
        appBar: PrimaryAppBar(
          title: widget.todoModel != null ? 'Edit Todo' : 'Create Todo',
          onBack: () {
            Navigator.of(context).pop();
          },
        ),
        body: Stack(
          children: [
            _buildBodyWidget(),
            if (isLoading) _buildLoadingWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildBodyWidget() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  InputField(
                    initialValue: title,
                    hintText: "Title",
                    maxLines: 1,
                    onChanged: (value) {
                      setState(() {
                        title = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputField(
                    hintText: "Description",
                    initialValue: description,
                    maxLines: 4,
                    onChanged: (value) {
                      setState(() {
                        description = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  PrimaryButton(
                    title:
                        widget.todoModel != null ? 'Edit Todo' : 'Create Todo',
                    onTap: () async {
                      if (widget.todoModel != null) {
                        await _updateTodo(
                          id: widget.todoModel!.id,
                          title: title ?? "",
                          description: description ?? "",
                          isCompleted: widget.todoModel?.isCompleted ?? false,
                        );
                      } else {
                        await _createTodo(
                          title: title ?? "",
                          description: description ?? "",
                          isCompleted: widget.todoModel?.isCompleted ?? false,
                        );
                      }

                      if (mounted) {
                        Navigator.of(context).pop(true);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  if (widget.todoModel != null)
                    DeleteButton(
                      title: 'Delete Todo',
                      onTap: () async {
                        final result =
                            await _showDeleteConfirmationDialog() as bool?;
                        if (result == true) {
                          await _deleteTodo(
                            id: widget.todoModel!.id,
                          );
                          if (mounted) {
                            Navigator.of(context).pop(true);
                          }
                        }
                      },
                    ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _updateTodo({
    required String id,
    required String title,
    required String description,
    required bool isCompleted,
  }) async {
    try {
      setState(() {
        isLoading = true;
      });
      await TodoService().updateTodo(
        id: id,
        title: title,
        description: description,
        isCompleted: isCompleted,
      );
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _createTodo({
    required String title,
    required String description,
    required bool isCompleted,
  }) async {
    try {
      setState(() {
        isLoading = true;
      });
      await TodoService().createTodo(
        title: title,
        description: description,
        isCompleted: isCompleted,
      );
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _showDeleteConfirmationDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete todo'),
          content: const Text('Are you sure you want to delete this todo?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(true);
              },
              child: const Text(
                'Delete',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteTodo({
    required String id,
  }) async {
    try {
      setState(() {
        isLoading = true;
      });
      await TodoService().deleteTodo(
        id: id,
      );
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
