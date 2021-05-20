import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_task/common/center_error.dart';
import 'package:work_task/common/center_loader.dart';
import 'package:work_task/constants.dart';
import 'package:work_task/works/bloc/works_bloc.dart';
import 'package:work_task/works/bloc/works_event.dart';
import 'package:work_task/works/bloc/works_state.dart';
import 'package:work_task/works/models/work.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'work_item.dart';

class WorksBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorksBloc, WorksState>(
      builder: (BuildContext context, WorksState state) {
        if (state is WorksLoadedState) {
          //loaded state
          if (state.works.isEmpty) {
            return _buildEmptyBody(context);
          } else {
            return _buildBody(state.works);
          }
        } else if (state is WorksErrorState) {
          //error state
          return CenterError(state.message);
        }
        return CenterLoader();
        //loading state
      },
    );
  }

  Widget _buildEmptyBody(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Generate'),
        onPressed: () => _onClickGenerate(context),
      ),
    );
  }

  Widget _buildBody(List<Work> works) {
    return ListView.builder(
        itemCount: works.length,
        itemBuilder: (context, index) => WorkItem(works[index]));
  }

  void _onClickGenerate(BuildContext context) {
    context.read<WorksBloc>().add(AddWorks());
  }
}
