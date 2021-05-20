import 'package:equatable/equatable.dart';
import 'package:work_task/works/models/work.dart';

abstract class WorksEvent extends Equatable {}

class AddWorks extends WorksEvent {
  @override
  List<Object> get props => [];
}

class DeleteWorks extends WorksEvent {
  @override
  List<Object> get props => [];
}

class RemoveSelected extends WorksEvent {
  @override
  List<Object> get props => [];
}

class SelectWork extends WorksEvent {
  final int number;

  SelectWork(this.number);

  @override
  List<Object> get props => [number];
}
