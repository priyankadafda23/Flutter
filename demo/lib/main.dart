import 'package:flutter/material.dart';
// import './stopwatch/stopwatch.dart';
import 'register.dart';

// void main() {
//   runApp(const StopWatchRun());
// }

// class StopWatchRun extends StatelessWidget {
//   const StopWatchRun({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: StopWatchExample(),
//     );
//   }
// }

void main() {
  runApp(const RegisterRun());
}

class RegisterRun extends StatelessWidget {
  const RegisterRun({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterExercise(),
    );
  }
}