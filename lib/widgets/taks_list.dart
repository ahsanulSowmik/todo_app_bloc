import 'package:flutter/material.dart';
import 'package:todo_app_bloc/models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    print(taskList.length);
    return Expanded(
      child: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            var task = taskList[index];
            return ListTile(
              title: Text(task.title),
              trailing: Checkbox(value: task.isDone, onChanged: (value) {}),
            );
          }),
    );
  }
}
