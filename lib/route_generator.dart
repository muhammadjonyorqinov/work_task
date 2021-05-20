import 'package:flutter/material.dart';
import 'package:work_task/tasks/view/tasks_screen.dart';
import 'package:work_task/works/view/works_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case TasksScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => TasksScreen(),
        );
      case WorksScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => WorksScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(child: Text('ERROR')),
      );
    });
  }
}
