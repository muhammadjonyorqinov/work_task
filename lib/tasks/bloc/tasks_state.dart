import 'package:equatable/equatable.dart';
import 'package:work_task/tasks/models/task.dart';

abstract class TasksState extends Equatable {}

class TasksInitialState extends TasksState {
  @override
  List<Object> get props => [];
}

class TasksLoadingState extends TasksState {
  @override
  List<Object> get props => [];
}

class TasksLoadedState extends TasksState {
  final List<Task> tasks;

  TasksLoadedState({this.tasks});

  TasksLoadedState copyWith({task}) {
    return TasksLoadedState(
      tasks: task,
    );
  }

  @override
  List<Object> get props => [tasks];
}

class TasksErrorState extends TasksState {
  final String message;

  TasksErrorState(this.message);

  @override
  List<Object> get props => [message];
}
