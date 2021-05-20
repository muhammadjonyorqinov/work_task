import 'package:flutter/material.dart';

import '../constants.dart';


class CenterError extends StatelessWidget {
  final String error;

  CenterError(this.error);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
        style: kTextStyle.copyWith(color: Colors.red),
      ),
    );
  }
}
