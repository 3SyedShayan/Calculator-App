import 'package:calculator_app/data/numbers.dart';
import 'package:calculator_app/data/operations.dart';
import 'package:calculator_app/model/colors.dart';
import 'package:calculator_app/widgets/calculator_button.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String num1 = '';

  String num2 = '';

  bool isOperationSelected = false;

  double answer = 0;
  String operation = '';

  void _errorText(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
  }

  List<String> history = [];
  void _history() {
    if (history.length >= 4) {
      history.insert(0, "$num1 $operation $num2 = ${_formatedAnswer(answer)}");
      history.removeAt(4);
      setState(() {
        history;
      });
    } else {
      history.insert(0, "$num1 $operation $num2 = ${_formatedAnswer(answer)}");
      setState(() {
        history;
      });
    }
  }

  void numOperation(String allNum) {
    if (isOperationSelected == false) {
      setState(() {
        num1 += allNum;
      });
    } else {
      setState(() {
        num2 += allNum;
      });
    }
  }

  void calculations() {
    switch (operation) {
      case '+':
        answer = (double.parse(num1) + double.parse(num2));
        break;
      case '-':
        answer = (double.parse(num1) - double.parse(num2));
        break;
      case '*':
        answer = (double.parse(num1) * double.parse(num2));
        break;
      case '/':
        if (num2 == '' || num2 == '0') {
          _errorText("Cannot Divide by Zero");
        } else {
          answer = (double.parse(num1) / double.parse(num2));
          break;
        }
      case '':
        _errorText("               Something went wrong");
        answer = 0;
        break;
      default:
        _errorText("Invalid Operation");
        answer = 0;
    }

    setState(() {
      this.answer = answer;
      this.num1 = num1;
      this.num2 = num2;
      this.operation = operation;
    });
    _history();
  }

  String _formatedAnswer(double answer) {
    if (answer % 1 == 0) {
      return answer.toInt().toString();
    } else {
      return answer.toStringAsFixed(2);
    }
  }

  void clearHistory() {
    setState(() {
      history.clear();
    });
  }

  void onOperation(String allOp) {
    if (allOp == '=') {
      calculations();
    } else if (allOp == "AC") {
      num1 = '';
      num2 = '';
      isOperationSelected = false;
      operation = '';
      setState(() {
        answer = 0;
      });
    } else if (allOp == '+/-') {
      if (!isOperationSelected && num1.isNotEmpty) {
        if (num1.startsWith("-")) {
          num1 = num1.substring(1);
        } else {
          num1 = "-$num1";
        }
        setState(() {
          num1;
          num2;
        });
      } else if (num2.startsWith("-")) {
        num2 = num2.substring(1);
      } else {
        num2 = "-$num2";
      }
      setState(() {
        num1;
        num2;
      });
    } else if (allOp == '.') {
      if (isOperationSelected == false) {
        num1 += '.';
      } else {
        num2 += '.';
      }
      setState(() {
        num1 = num1;
        num2 = num2;
      });
    } else if (allOp == '<-') {
      if (isOperationSelected == false) {
        num1 = num1.substring(0, num1.length - 1);
      } else {
        num2 = num2.substring(0, num2.length - 1);
      }

      setState(() {
        num1 = num1;
        num2 = num2;
      });
    } else {
      setState(() {
        operation = allOp;
      });
      isOperationSelected = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(
          children: [
            // Header
            Container(
              height: 50,
              width: double.infinity,
              color: kHeaderColor,
              child: const Center(
                child: Text(
                  'Calculator',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            //History Section
            Container(
              padding: EdgeInsets.fromLTRB(15, 10, 10, 5),
              alignment: Alignment.topLeft,
              child: Text(
                "History",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Calculations History
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 10, 10),
              height: MediaQuery.of(context).size.height * 0.12,

              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  return Text(
                    history[index],
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  );
                },
              ),
            ),

            Divider(color: Colors.white24, thickness: 1),

            // Display Section
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                "$num1 $operation $num2  ${answer == 0 ? "" : " = ${_formatedAnswer(answer)}"}",
                style: const TextStyle(
                  fontSize: 38,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            // Calculator Buttons
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.4,
                  mainAxisExtent: 100,
                  crossAxisCount: 4,
                ),
                itemCount: (allNumbers.length + allOperations.length),
                itemBuilder: (context, index) {
                  if (index < 4 || (index + 1) % 4 == 0) {
                    if (index < 4) {
                      return CalculatorButton(
                        color: allOperations[index].color,
                        text: allOperations[index].name,
                        onTap: () {
                          onOperation(allOperations[index].operation);
                        },
                      );
                    }
                    if (index == 7) {
                      return CalculatorButton(
                        color: allOperations[index - 3].color,
                        text: allOperations[index - 3].name,
                        onTap: () {
                          onOperation(allOperations[index - 3].operation);
                        },
                      );
                    }
                    if (index == 11) {
                      return CalculatorButton(
                        color: allOperations[index - 6].color,
                        text: allOperations[index - 6].name,
                        onTap: () {
                          onOperation(allOperations[index - 6].operation);
                        },
                      );
                    }
                    if (index == 15) {
                      return CalculatorButton(
                        color: allOperations[index - 9].color,
                        text: allOperations[index - 9].name,
                        onTap: () {
                          onOperation(allOperations[index - 9].operation);
                        },
                      );
                    }
                    if (index == 19) {
                      return CalculatorButton(
                        color: allOperations[index - 10].color,
                        text: allOperations[index - 10].name,
                        onTap: () {
                          onOperation(allOperations[index - 10].operation);
                        },
                      );
                    }
                  } else {
                    if (index < 7) {
                      return CalculatorButton(
                        color: allNumbers[index - 4].color,
                        text: allNumbers[index - 4].name,
                        onTap: () {
                          numOperation(allNumbers[index - 4].name);
                        },
                      );
                    } else if (index > 7 && index < 11) {
                      return CalculatorButton(
                        color: allNumbers[index - 5].color,
                        text: allNumbers[index - 5].name,
                        onTap: () {
                          numOperation(allNumbers[index - 5].name);
                        },
                      );
                    } else if (index > 11 && index < 15) {
                      return CalculatorButton(
                        color: allNumbers[index - 6].color,
                        text: allNumbers[index - 6].name,
                        onTap: () {
                          numOperation(allNumbers[index - 6].name);
                        },
                      );
                    } else if (index == 16) {
                      return CalculatorButton(
                        color: allNumbers[index - 7].color,
                        text: allNumbers[index - 7].name,
                        onTap: () {
                          numOperation(allNumbers[index - 7].name);
                        },
                      );
                    } else if (index > 16 && index < 21) {
                      return CalculatorButton(
                        color: allOperations[index - 10].color,
                        text: allOperations[index - 10].name,
                        onTap: () {
                          onOperation(allOperations[index - 10].operation);
                        },
                      );
                    } else {
                      print("error at Index: $index");
                      return const SizedBox.shrink();
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
