import 'package:flutter/material.dart';
import 'package:work_task/constants.dart';
import 'package:work_task/works/bloc/works_bloc.dart';
import 'package:work_task/works/bloc/works_event.dart';
import 'package:work_task/works/models/work.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkItem extends StatelessWidget {
  final Work work;

  WorkItem(this.work);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: work.isSelected ? Colors.black : Colors.white,
            width: work.isSelected ? 2 : 0,
          ),
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                'Work# ${work.number}',
                style: kTextStyle,
              ),
              Spacer(),
              Text(
                '${work.duration} sec.',
                style: kTextStyle,
              ),
            ],
          ),
        ),
      ),
      onTap: () => onClickWork(work, context),
    );
  }

  onClickWork(Work work, BuildContext context) {
    context.read<WorksBloc>().add(SelectWork(work.number));
  }
}
