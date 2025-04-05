import 'package:calculator_app/data/numbers.dart';
import 'package:calculator_app/data/operations.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
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
            child: Container(
              color: Colors.green,
              child: const Center(
                child: Text(
                  'Calculator Body',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.5,

              crossAxisCount: 4,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              if (index % 4 == 0) {
                return Container(
                  color: allOperations[index].color,
                  child: InkWell(child: Text(allOperations[index].name), onTap: () {},),
                );
              } else {
                return Container(
                  color: allNumbers[index].color,
                  child: InkWell(child: Text(allNumbers[index].name), onTap: () {},),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
