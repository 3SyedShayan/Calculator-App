import 'package:calculator_app/model/operations.dart';
import 'package:flutter/material.dart';

var allOperations =
    {
      Operations(name: "AC", operation: "AC", color: Color(0xFFF44336)),
      Operations(name: "+/-", operation: "-", color: Color(0xFF546E7A)),
      Operations(name: "%", operation: "%", color: Color(0xFFFFCA28)),
      Operations(name: "/", operation: "/", color: Color(0xFF3F51B5)),
      Operations(name: "*", operation: "*", color: Color(0xFF3F51B5)),
      Operations(name: "-", operation: "-", color: Color(0xFF3F51B5)),
      Operations(name: "+", operation: "+", color: Color(0xFF3F51B5)),
      Operations(name: ".", operation: ".", color: Color(0xFF455A64)),
      Operations(name: "=", operation: "=", color: Color(0xFF66BB6A)),
      Operations(name: "<-", operation: "<-", color: Color(0xFF26A69A)),
    }.toList();
