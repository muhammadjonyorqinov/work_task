import 'dart:async';

import 'package:flutter/material.dart';
import 'package:work_task/constants.dart';
import 'package:work_task/tasks/models/task.dart';

class TaskItem extends StatefulWidget {
  final Task task;

  TaskItem(this.task);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  Timer timer;
  int time;

  @override
  void initState() {
    super.initState();
    time = widget.task.time;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        time--;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (time == 0) {
      timer.cancel();
    }
    return Card(
      elevation: 5,
      color: time != 0 ? Colors.white : Colors.green.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${widget.task.works.length} work(s) in task',
              style: kTextStyle.copyWith(
                fontSize: 20,
              ),
            ),
            Row(
              children: [
                Text(
                  time != 0 ? 'left sec:$time' : 'Task done',
                  style: kTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
                Spacer(),
                time != 0
                    ? SizedBox(
                        height: 32,
                        width: 32,
                        child: CircularProgressIndicator(
                          value: 1 - (1 - time / widget.task.time),
                        ))
                    : Icon(Icons.check),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
