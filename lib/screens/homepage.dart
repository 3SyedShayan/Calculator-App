import 'package:calculator_app/data/numbers.dart';
import 'package:calculator_app/data/operations.dart';
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

  void calculations() {
    print("Num 1 is $num1");
    print("Num 2 is $num2");
    print("Operation is $operation");

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
          print("Cannot Divide by Zero");
        } else {
          answer = (double.parse(num1) / double.parse(num2));
          break;
        }
      case '':
        print("Something went Wrong");
        answer = 0;
        break;
      default:
        print("Invalid Operation: Error");
        answer = 0;
    }

    setState(() {
      this.answer = answer;
      this.num1 = num1;
      this.num2 = num2;
      this.operation = operation;
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
          Text(
            "$num1 $operation $num2 ${answer == 0 ? "" : " = ${answer.toStringAsFixed(5)}"}",
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
              itemCount: 18,
              itemBuilder: (context, index) {
                if (index < 10) {
                  return Container(
                    color: allNumbers[index].color,
                    child: InkWell(
                      splashColor: Colors.purple,
                      child: Center(child: Text(allNumbers[index].name)),
                      onTap: () {
                        print("Entered num variables reassigning stage");
                        if (isOperationSelected == false) {
                          print(
                            "Num reassigning, isOperationSelected is $isOperationSelected",
                          );
                          setState(() {
                            num1 += allNumbers[index].name;
                          });
                        } else {
                          print(
                            "Num reassigning, isOperationSelected is $isOperationSelected",
                          );
                          setState(() {
                            num2 += allNumbers[index].name;
                          });
                        }
                      },
                    ),
                  );
                } else {
                  return Container(
                    color: allOperations[(index - 10)].color,
                    child: InkWell(
                      splashColor: Colors.red,
                      child: Center(
                        child: Text(allOperations[(index - 10)].name),
                      ),
                      onTap: () {
                        if (allOperations[(index - 10)].name == '=') {
                          calculations();
                        } else if (allOperations[(index - 10)].name == 'AC') {
                          num1 = '';
                          num2 = '';
                          isOperationSelected = false;
                          operation = '';
                          setState(() {
                            answer = 0;
                          });

                          print("AC pressed");
                          print("Num 1 is $num1");
                          print("Num 2 is $num2");
                          print("Operation is $isOperationSelected");
                        } else if (allOperations[(index - 10)].name == '.') {
                          if (isOperationSelected == false) {
                            num1 += '.';
                          } else {
                            num2 += '.';
                          }
                          setState(() {
                            num1 = num1;
                            num2 = num2;
                          });
                        } else if (allOperations[(index - 10)].name == '<-') {
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
                            operation = allOperations[(index - 10)].name;
                          });
                          isOperationSelected = true;
                        }
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
