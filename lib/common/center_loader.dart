import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CenterLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(),
    );
  }
}
