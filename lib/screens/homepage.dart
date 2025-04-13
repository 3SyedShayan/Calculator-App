import 'package:calculator_app/data/numbers.dart';
import 'package:calculator_app/data/operations.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int num1 = 0;

  int num2 = 0;

  bool isOperationSelected = false;

  int answer = 0;
  String operation = '//';

  int calculations() {
    print("Num 1 is $num1");
    print("Num 2 is $num2");
    print("Operation is $operation");

    switch (operation) {
      case '+':
        answer = num1 + num2;
        break;
      case '-':
        answer = num1 - num2;
        break;
      case '*':
        answer = num1 * num2;
        break;
      case '/':
        answer = num1 ~/ num2;
        break;
      case '//':
        print("Something went Wrong");
        answer = 0;
        break;
      default:
        print("Invalid Operation: Error");
        answer = 0;
    }
    setState(() {
      print("Answer is $answer");
      this.answer = answer;
    });
    return answer;
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
                          num1 = allNumbers[index].value;
                        } else {
                          print(
                            "Num reassigning, isOperationSelected is $isOperationSelected",
                          );
                          num2 = allNumbers[index].value;
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
                          num1 = 0;
                          num2 = 0;
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
