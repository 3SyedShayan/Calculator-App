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
  String operation = '//';

  void calculations() {
    print("Num 1 is $num1");
    print("Num 2 is $num2");
    print("Operation is $operation");
    setState(() {
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
        case '//':
          print("Something went Wrong");
          answer = 0;
          break;
        default:
          print("Invalid Operation: Error");
          answer = 0;
      }
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
          Text("Answer is $answer", style: const TextStyle(fontSize: 30)),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.4,
                mainAxisExtent: 100,
                crossAxisCount: 4,
              ),
              itemCount: 16,
              itemBuilder: (context, index) {
                if (index < 10) {
                  return Container(
                    color: allNumbers[index].color,
                    child: InkWell(
                      child: Text(allNumbers[index].name),
                      onTap: () {
                        print("Entered num variables reassigning stage");
                        if (isOperationSelected == false) {
                          print(
                            "Num reassigning, isOperationSelected is $isOperationSelected",
                          );
                          num1 += allNumbers[index].name;
                        } else {
                          print(
                            "Num reassigning, isOperationSelected is $isOperationSelected",
                          );
                          num2 += allNumbers[index].name;
                        }
                      },
                    ),
                  );
                } else {
                  return Container(
                    color: allOperations[(index - 10)].color,
                    child: InkWell(
                      child: Text(allOperations[(index - 10)].name),
                      onTap: () {
                        if (allOperations[(index - 10)].name == '=') {
                          calculations();
                        } else if (allOperations[(index - 10)].name == 'AC') {
                          num1 = '';
                          num2 = '';
                          isOperationSelected = false;
                          setState(() {
                            answer = 0;
                          });

                          print("AC pressed");
                          print("Num 1 is $num1");
                          print("Num 2 is $num2");
                          print("Operation is $isOperationSelected");
                        } else {
                          operation = allOperations[(index - 10)].name;
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
