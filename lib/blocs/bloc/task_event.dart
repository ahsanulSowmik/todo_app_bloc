part of 'task_bloc.dart';

abstract class TaskEvents extends Equatable {
  const TaskEvents();

  @override
  List<Object> get props => [];
}


class UpdateTask extends TaskEvents {
  final Task task;
  const UpdateTask({
    required this.task,
  });

   @override
  List<Object> get props => [task];

}

class DeleteTask extends TaskEvents {
  final Task task;
  const DeleteTask({
    required this.task,
  });

   @override
  List<Object> get props => [task];

}


class AddTask extends TaskEvents {
  final Task task;
  const AddTask({
    required this.task,
  });

  @override
  List<Object> get props => [];

  
  

}
