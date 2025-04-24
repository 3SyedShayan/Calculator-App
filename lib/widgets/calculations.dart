import 'package:flutter/material.dart';

class Calculations extends StatelessWidget {
  const Calculations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          color: Colors.red,
          child: Center(
            child: Text(
              'Calculator',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: ListView.builder(
              itemCount: 10, // Replace with your history length
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'History Item $index',
                  ), // Replace with your history item
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
