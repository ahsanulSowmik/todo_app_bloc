import 'package:flutter/material.dart';
import 'package:todo_app_bloc/models/task.dart';
import 'package:todo_app_bloc/widgets/taks_list.dart';

import '../blocs/bloc_exports.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({Key? key}) : super(key: key);

  List<Task> taskList = [
    Task(title: "task"),
    Task(title: "task"),
    Task(title: "task"),
  ];

  TextEditingController titleController = TextEditingController();

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(titleController: titleController))));
  }

  print("something");

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks App'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Chip(
                  label: Text(
                    'Tasks:',
                  ),
                ),
              ),
              TasksList(taskList: tasksList)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
    required this.titleController,
  }) : super(key: key);

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(children: [
        Text(
          "Add Task",
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          autofocus: true,
          controller: titleController,
          decoration: const InputDecoration(
            label: Text('Title'),
            border: OutlineInputBorder(),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("cancel")),
          ElevatedButton(
              onPressed: () {
                var task = Task(
                  title: titleController.text,
                );
                print(task);
                context.read<TaskBloc>().add(AddTask(
                      task: task,
                    ));
                // TaskBloc()..add(AddTask(task: Task(title: "Task"))


                Navigator.pop(context);
              },
              child: const Text("Add")),
        ]),
      ]),
    );
  }
}
