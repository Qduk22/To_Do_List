import 'package:flutter/material.dart';
import 'package:homework/common_widgets/primary_app_bar.dart';

import 'package:homework/screens/demo/services/todo_service.dart';
import 'package:homework/screens/demo/widgets/todo_item_widget.dart';
import 'package:homework/screens/home/widgets/add_button.dart';

import '../../constants/app_colors.dart';
import 'detail_screen.dart';
import 'models/todo_model.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  List<TodoModel>? todos;

  String? error;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hex020206,
      appBar: const PrimaryAppBar(
        title: 'Todos',
        onBack: null,
      ),
      body: Stack(
        children: [_buildBodyWidget(), if (isLoading) _buildLoadingWidget()],
      ),
      floatingActionButton: AddButton(
        onTap: () async {
          await _navigateToDetailScreen(
            todoModel: null,
          );
        },
      ),
    );
  }

  Widget _buildBodyWidget() {
    if (error != null && error != "") {
      return Center(
        child: Text(
          error!,
          style: const TextStyle(
            color: Colors.red,
          ),
        ),
      );
    } else if (todos == null || (todos!.isEmpty && isLoading)) {
      return Container();
    } else if (todos!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'No todos',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () async {
                await _getTodos();
              },
              child: const Text('Reload'),
            ),
          ],
        ),
      );
    } else {
      return ListView.builder(
        itemCount: todos!.length,
        itemBuilder: (context, index) {
          final todo = todos![index];
          return TodoItemWidget(
            todoModel: todo,
            onTap: () async {
              await _navigateToDetailScreen(todoModel: todo);
            },
            onStatusChanged: (isCompleted) async {
              await _updateTodo(
                id: todo.id,
                title: todo.title,
                description: todo.description,
                isCompleted: isCompleted,
              );
            },
          );
        },
      );
    }
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Future<void> _getTodos() async {
    try {
      setState(() {
        isLoading = true;
      });
      final todos = await TodoService().getTodos();
      setState(() {
        this.todos = todos;
      });
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
      final todos = await TodoService().getTodos();
      setState(() {
        this.todos = todos;
      });
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

  Future<void> _navigateToDetailScreen({
    required TodoModel? todoModel,
  }) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return DetailScreen(
            todoModel: todoModel,
          );
        },
      ),
    ) as bool?;
    if (result == true) {
      await _getTodos();
    }
  }
}
