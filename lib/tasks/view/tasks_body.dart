import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_task/constants.dart';
import 'package:work_task/tasks/bloc/tasks_bloc.dart';
import 'package:work_task/tasks/bloc/tasks_state.dart';
import 'package:work_task/tasks/models/task.dart';

import 'task_item.dart';

class TasksBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksBloc, TasksState>(
      listener: (BuildContext context, TasksState state) {},
      builder: (BuildContext context, TasksState state) {
        if (state is TasksLoadedState) {
          if (state.tasks.isEmpty) {
            return Center(
              child: Text(
                'No tasks yet',
                style: kTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            );
          } else {
            return _buildTasks(state.tasks);
          }
        } else if (state is TasksErrorState) {
          //error state
        }
        //loading state
        return Container();
      },
    );
  }

  Widget _buildTasks(List<Task> tasks) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskItem(tasks[index]);
        });
  }
}
