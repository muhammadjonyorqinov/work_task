import 'package:equatable/equatable.dart';
import 'package:work_task/works/models/work.dart';

abstract class TasksEvent extends Equatable {}

class AddTask extends TasksEvent {
  final List<Work> selected;

  AddTask(this.selected);

  @override
  List<Object> get props => [selected];
}
