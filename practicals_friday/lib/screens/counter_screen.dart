import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
        // actions: [
        //   IconButton(
        //     onPressed:(){},
        //     icon:Icon(Icons.person)
        //     ),
        // ],
      ),
      body: Column(
        children: [
          Text('0'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Increment'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('Decrement'),
              ),
            ],
          ),
        ],
      )
    );
  }
}