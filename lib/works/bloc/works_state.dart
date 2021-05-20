import 'package:equatable/equatable.dart';
import '../../works/models/work.dart';

abstract class WorksState extends Equatable {}

class WorksInitialState extends WorksState {
  @override
  List<Object> get props => [];
}

class WorksLoadingState extends WorksState {
  @override
  List<Object> get props => [];
}

class WorksLoadedState extends WorksState {
  final List<Work> works;

  WorksLoadedState({
    this.works,
  });

  WorksLoadedState copyWith({work}) {
    return WorksLoadedState(
      works: work,
    );
  }

  @override
  List<Object> get props => [works];
}

class WorksErrorState extends WorksState {
  final String message;

  WorksErrorState(this.message);

  @override
  List<Object> get props => [message];
}
