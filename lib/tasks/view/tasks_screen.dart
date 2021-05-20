import 'package:flutter/material.dart';
import 'package:work_task/tasks/view/tasks_body.dart';
import 'package:work_task/works/view/works_screen.dart';

class TasksScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: TasksBody(),
      floatingActionButton: _buildFAB(context),
    );
  }

  FloatingActionButton _buildFAB(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.of(context).pushNamed(WorksScreen.routeName),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Tasks'),
    );
  }
}
