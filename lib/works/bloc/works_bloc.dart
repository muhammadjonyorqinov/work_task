import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_task/works/models/work.dart';
import 'works_event.dart';
import 'works_state.dart';

class WorksBloc extends Bloc<WorksEvent, WorksState> {
  List<Work> works = [];

  WorksBloc() : super(WorksLoadedState(works: []));

  @override
  Stream<WorksState> mapEventToState(WorksEvent event) async* {
    if (event is AddWorks) {
      yield WorksLoadingState();
      try {
        works = List.generate(
          900,
          (index) => Work(
            number: index,
            duration: Random().nextInt(16) + 5,
            isSelected: false,
          ),
        );
        yield WorksLoadedState(works: works);
      } catch (e) {
        yield WorksErrorState(e.toString());
      }
    }
    if (event is DeleteWorks) {
      try {
        works = [];
        print(works.length);
        yield WorksLoadedState(
          works: works,
        );
      } catch (e) {
        yield WorksErrorState(e.toString());
      }
    }
    if (event is SelectWork) {
      yield WorksLoadingState();
      try {
        final work =
            works.firstWhere((element) => element.number == event.number);
        work.isSelected = !work.isSelected;
        yield WorksLoadedState(works: works);
      } catch (e) {
        yield WorksErrorState(e.toString());
      }
    }
    if (event is RemoveSelected) {
      yield WorksLoadingState();
      try {
        for (Work work in works) {
          if (work.isSelected) {
            work.isSelected = false;
          }
        }
        yield WorksLoadedState(works: works);
      } catch (e) {
        yield WorksErrorState(e.toString());
      }
    }
  }
}
