import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_bloc/models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvents, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;

    // print(event.task.isDeleted);
    emit(TaskState(
      allTasks: List.from(state.allTasks)..add(event.task),
    ));
    // notifyListeners();
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    // final state = this.state;

    // emit(TaskState(

    //   allTasks: List.from(state.allTasks)..add(event.task),

    // ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    // final state = this.state;

    // emit(TaskState(

    //   allTasks: List.from(state.allTasks)..add(event.task),

    // ));
  }
}
