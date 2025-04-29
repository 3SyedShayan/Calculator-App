import 'package:flutter/material.dart';

class GridTitleSpan extends StatelessWidget {
  GridTitleSpan({super.key, required this.child, this.rowSpan = 1, this.columnSpan = 1});

  Widget child;
  final int rowSpan;
  final int columnSpan;


  @override
  Widget build(context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: child,
    );
  }
}
