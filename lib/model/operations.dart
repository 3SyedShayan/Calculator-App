import 'package:calculator_app/model/colors.dart';
import 'package:flutter/material.dart';

class Operations {
  Operations({required this.name, required this.operation, this.color = kExtraButtonColor,
  });
  String name;
  String operation;
  Color color;
}
