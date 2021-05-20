import 'package:get_it/get_it.dart';
import 'package:work_task/tasks/bloc/tasks_bloc.dart';
import 'package:work_task/works/bloc/works_bloc.dart';

final ls = GetIt.instance;

Future<void> setup() async {
  ls.registerFactory<TasksBloc>(
    () => TasksBloc(),
  );
  ls.registerFactory<WorksBloc>(
    () => WorksBloc(),
  );
}
