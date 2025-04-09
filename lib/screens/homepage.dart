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
                      onTap: () {},
                    ),
                  );
                } else {
                  return Container(
                    color: allOperations[(index-10)].color,
                    child: InkWell(
                      child: Text(allOperations[index].name),
                      onTap: () {},
                    ),
                  );
                }
                // return Container(
                //   color: allNumbers[index].color,
                //   child: InkWell(
                //     child: Text(allNumbers[index].name),
                //     onTap: () {},
                //   ),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
