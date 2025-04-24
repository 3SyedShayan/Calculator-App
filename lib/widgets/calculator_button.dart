import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  CalculatorButton({
    super.key,
    required this.color,
    required this.text,
    required this.onTap,
  });
  Color color;
  String text;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: color,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Center(child: Text(text, style: TextStyle(color: Colors.white))),
    );
  }
}
