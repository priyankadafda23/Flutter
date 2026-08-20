import 'package:flutter/material.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({super.key});

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child:TextField()),
              const SizedBox(width: 10),
              Row(
                children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('MC'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('MR'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('M+'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('M-'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('MS'), 
                ),
              const SizedBox(width: 10),

              ElevatedButton(
                  onPressed: () {},
                  child: const Text('Mv'),
                ),
              ]),


                Row(
                children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('%'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('CE'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('C'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Back'),
                ),
                const SizedBox(width: 10),
              ]),


              Row(
                children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('1/x'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('x^2'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('2√x'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('÷'),
                ),
                const SizedBox(width: 10),
              ]),


              Row(
                children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('7'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('8'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('9'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('x'),
                ),
                const SizedBox(width: 10),
              ]),


              Row(
                children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('4'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('5'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('6'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('-'),
                ),
                const SizedBox(width: 10),
              ]),


              Row(
                children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('1'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('2'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('3'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('+'),
                ),
                const SizedBox(width: 10),
              ]),


              Row(
                children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('+/-'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('0'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('.'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('=',
                  style: TextStyle(backgroundColor: Colors.blue)),
                  ),
            ])
              ]),
              ],
              )
          );
  }
}