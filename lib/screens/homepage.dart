import 'package:calculator_app/data/numbers.dart';
import 'package:calculator_app/data/operations.dart';
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
    if (history.length >= 5) {
      history.insert(0, "$num1 $operation $num2 = ${_formatedAnswer(answer)}");
      history.removeAt(5);
      setState(() {
        history;
      });
      print("With Parameter ${history[0]}");
    } else {
      history.insert(0, "$num1 $operation $num2 = ${_formatedAnswer(answer)}");
      setState(() {
        history;
      });
      print("No Parameter ${history[0]}");
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.red,
            child: const Center(
              child: Text(
                'Calculator',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) => Text(history[index]),
            ),
          ),
          Text(
            "$num1 $operation $num2  ${answer == 0 ? "" : " = ${_formatedAnswer(answer)}"}",
            style: const TextStyle(fontSize: 25),
          ),

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
                String allNum = allNumbers[index].name;
                Color allNumColor = allNumbers[index].color;
                if (index < allNumbers.length) {
                  return CalculatorButton(
                    color: allNumColor,
                    text: allNum,
                    onTap: () {
                      if (isOperationSelected == false) {
                        setState(() {
                          num1 += allNum;
                        });
                      } else {
                        setState(() {
                          num2 += allNum;
                        });
                      }
                    },
                  );
                } else {
                  return Text(allOperations[(index - allNumbers.length)].name);
                }
                //   String allOp = allOperations[(index - 10)].name;
                //   Color allOpColor = allOperations[(index - 10)].color;
                //   print("OP Color is $allOpColor[]");
                //   print("AllOp is $allOp");
                // }
                //   return CalculatorButton(
                //     color: allOpColor,
                //     text: allOp,
                //     onTap: () {
                //       if (allOp == '=') {
                //         calculations();
                //       } else if (allOp == "AC") {
                //         num1 = '';
                //         num2 = '';
                //         isOperationSelected = false;
                //         operation = '';
                //         setState(() {
                //           answer = 0;
                //         });
                //       } else if (allOp == '+/-') {
                //         if (!isOperationSelected && num1.isNotEmpty) {
                //           if (num1.startsWith("-")) {
                //             num1 = num1.substring(1);
                //           } else {
                //             num1 = "-$num1";
                //           }
                //           setState(() {
                //             num1;
                //             num2;
                //           });
                //         } else if (num2.startsWith("-")) {
                //           num2 = num2.substring(1);
                //         } else {
                //           num2 = "-$num2";
                //         }
                //         setState(() {
                //           num1;
                //           num2;
                //         });
                //       } else if (allOp == '.') {
                //         if (isOperationSelected == false) {
                //           num1 += '.';
                //         } else {
                //           num2 += '.';
                //         }
                //         setState(() {
                //           num1 = num1;
                //           num2 = num2;
                //         });
                //       } else if (allOp == '<-') {
                //         if (isOperationSelected == false) {
                //           num1 = num1.substring(0, num1.length - 1);
                //         } else {
                //           num2 = num2.substring(0, num2.length - 1);
                //         }

                //         setState(() {
                //           num1 = num1;
                //           num2 = num2;
                //         });
                //       } else {
                //         setState(() {
                //           operation = allOp;
                //         });
                //         isOperationSelected = true;
                //       }
                //     },
                //   );
                // }
                // if (index < 10) {
                //   String allNum = allNumbers[index].name;
                //   return Container(
                //     color: allNumbers[index].color,
                //     child: InkWell(
                //       splashColor: Colors.purple,
                //       child: Center(child: Text(allNum)),
                //       onTap: () {
                //       if (isOperationSelected == false) {
                //         setState(() {
                //           num1 += allNum;
                //         });
                //       } else {
                //         setState(() {
                //           num2 += allNum;
                //         });
                //       }
                //     },
                //   ),
                // );
                // // }
                // else {
                //   String allOp = allOperations[(index - 10)].name;
                //   return Container(
                //     color: allOperations[(index - 10)].color,
                //     child: InkWell(
                //       splashColor: Colors.red,
                //       child: Center(child: Text(allOp)),
                //       onTap: () {
                // if (allOp == '=') {
                //   calculations();
                // } else if (allOp == "AC") {
                //   num1 = '';
                //   num2 = '';
                //   isOperationSelected = false;
                //   operation = '';
                //   setState(() {
                //     answer = 0;
                //   });
                // } else if (allOp == '+/-') {
                //   if (!isOperationSelected && num1.isNotEmpty) {
                //     if (num1.startsWith("-")) {
                //       num1 = num1.substring(1);
                //     } else {
                //       num1 = "-$num1";
                //     }
                //     setState(() {
                //       num1;
                //       num2;
                //     });
                //   } else if (num2.startsWith("-")) {
                //     num2 = num2.substring(1);
                //   } else {
                //     num2 = "-$num2";
                //   }
                //   setState(() {
                //     num1;
                //     num2;
                //   });
                // } else if (allOp == '.') {
                //   if (isOperationSelected == false) {
                //     num1 += '.';
                //   } else {
                //     num2 += '.';
                //   }
                //   setState(() {
                //     num1 = num1;
                //     num2 = num2;
                //   });
                // } else if (allOp == '<-') {
                //   if (isOperationSelected == false) {
                //     num1 = num1.substring(0, num1.length - 1);
                //   } else {
                //     num2 = num2.substring(0, num2.length - 1);
                //   }

                //   setState(() {
                //     num1 = num1;
                //     num2 = num2;
                //   });
                // } else {
                //   setState(() {
                //     operation = allOp;
                //   });
                //   isOperationSelected = true;
                // }
                //       },
                //     ),
                //     );
                //   }
              },
            ),
          ),
        ],
      ),
    );
  }
}
