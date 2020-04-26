import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/modules/task_data.dart';
import './task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
                isChecked: task.isDone,
                taskTitle: task.name,
                checkboxCallback: (bool checkboxState) {
                  taskData.updateTask(task);
                },
                deleteCallback: () {
                  taskData.deleteTask(task);
                });
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
