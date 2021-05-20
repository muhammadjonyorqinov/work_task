import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_task/tasks/models/task.dart';
import 'package:work_task/works/models/work.dart';
import 'tasks_state.dart';

import 'tasks_event.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  List<Task> tasks = [];

  TasksBloc() : super(TasksLoadedState(tasks: []));

  @override
  Stream<TasksState> mapEventToState(TasksEvent event) async* {
    if (event is AddTask) {
      yield TasksLoadingState();
      try {
        int time = 0;
        for(Work work in event.selected){
          time+=work.duration;
        }
        tasks.add(Task(event.selected,time));
        print(tasks.length);
        yield TasksLoadedState(tasks: tasks);
      } catch (e) {
        yield TasksErrorState(e.toString());
      }
    }
  }
}
