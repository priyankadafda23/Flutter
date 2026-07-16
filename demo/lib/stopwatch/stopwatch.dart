import 'package:flutter/material.dart';
import 'dart:async';

class StopWatchExample extends StatefulWidget {
  const StopWatchExample({super.key});

  @override
  State<StopWatchExample> createState() => _StopWatchExampleState();
}

class _StopWatchExampleState extends State<StopWatchExample> {
  //int seconds = 0;
  int milliseconds = 0;
  final laps=<int>[];
  late Timer timer;
  bool isRunning = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onTick(Timer timer) {
    setState(() {
      if(isRunning){
        //seconds++;
        milliseconds += 100;
      }
    });
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 100), _onTick);
    setState(() {
      //seconds = 0;
      milliseconds = 0;
      isRunning = true;
    });
  }

// void _pauseTimer() {
//   setState(() {
//     isRunning = false;
//   });
// }

//void _resumeTimer() {
//  setState(() {
//    isRunning = true;
//  });
//}

  void _stopTimer() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

//String _secondToText()=> seconds == 1 ? '1 second' : '$seconds seconds';
  String _milisToSecond(milis){
    final seconds = milis/1000;
    return "$seconds seconds";
  }

  void _lap(){
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });
    print(laps);
  }

  void _clear(){
    setState(() {
      laps.clear();
      milliseconds = 0;
    });
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text('Lap: ${laps.length+1}',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
          ),
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              _milisToSecond(milliseconds),
              style: const TextStyle(fontSize: 48),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: isRunning ? null : _startTimer,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.green),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                ),
                child: const Text('Start'),
              ),
              const SizedBox(width: 20),

              // ElevatedButton(
              //   onPressed: isRunning ? _pauseTimer : null,
              //   style: ButtonStyle(
              //     backgroundColor: WidgetStateProperty.all(Colors.orange),
              //     foregroundColor: WidgetStateProperty.all(Colors.white),
              //   ),
              //   child: const Text('Pause'),
              // ),
              // const SizedBox(width: 20),

              // ElevatedButton(
              //   onPressed: isRunning ? null : _resumeTimer,
              //   style: ButtonStyle(
              //     backgroundColor: WidgetStateProperty.all(Colors.green),
              //     foregroundColor: WidgetStateProperty.all(Colors.white),
              //   ),
              //   child: const Text('Resume'),
              // ),
              // const SizedBox(width: 20),
              
              ElevatedButton(
                onPressed: isRunning ? _lap : null,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blue),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                ),
                child: const Text('Lap'),
              ),
              const SizedBox(width: 20),

              ElevatedButton(
                onPressed: _clear,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.orange),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                ),
                child: const Text('Clear'),
              ),
              const SizedBox(width: 20),

              ElevatedButton(
                onPressed: _stopTimer,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.red),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                ),
                child: const Text('Stop'),
              ),
            ],
          ),
        ],
      )
    );
  }
}