import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_task/tasks/bloc/tasks_bloc.dart';
import 'package:work_task/tasks/bloc/tasks_event.dart';
import 'package:work_task/works/bloc/works_bloc.dart';
import 'package:work_task/works/bloc/works_event.dart';
import 'package:work_task/works/bloc/works_state.dart';
import 'package:work_task/works/models/work.dart';
import 'package:work_task/works/view/works_body.dart';

class WorksScreen extends StatelessWidget {
  static const routeName = '/works';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: WorksBody(),
      floatingActionButton: _buildFAB(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Works'),
      actions: [
        BlocBuilder<WorksBloc, WorksState>(
          builder: (BuildContext context, WorksState state) {
            if (state is WorksLoadedState && state.works.isNotEmpty) {
              return IconButton(
                icon: Icon(Icons.delete_outline),
                onPressed: () => _onClickDelete(context),
              );
            }
            return Container();
          },
        )
      ],
    );
  }

  void _onClickDelete(BuildContext context) {
    context.read<WorksBloc>().add(DeleteWorks());
  }

  _buildFAB(BuildContext context) {
    return BlocBuilder<WorksBloc, WorksState>(
      builder: (BuildContext context, WorksState state) {
        if (state is WorksLoadedState) {
          final selected = state.works.where(
            (element) => element.isSelected,
          );
          if (selected.length != 0) {
            return FloatingActionButton(
                child: Icon(Icons.check),
                onPressed: () => _onClickFAB(context, selected.toList()));
          }
        }
        return SizedBox();
      },
    );
  }

  void _onClickFAB(BuildContext context, List<Work> selected) {
    context.read<TasksBloc>().add(AddTask(selected));
    context.read<WorksBloc>().add(RemoveSelected());
    Navigator.of(context).pop();
  }
}
