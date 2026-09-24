import 'package:flutter/material.dart';
//import './stopwatch/stopwatch.dart';
//import 'register.dart';
//import './calculator/calculator.dart';
//import './stopwatch/login.dart';
//import './inputcontrols/inputtextcontrol.dart';
//import './controls/imagedisp.dart';
//import './controls/gridview.dart';
//import './controls/tabview.dart';
import './techfest/register.dart';

//techfest/register.dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RegisterPage(),
    );
  }
}

//tabview.dart
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const TabViewExample(),
//     );
//   }
// }

//gridview.dart
// void main() {
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const GridViewExample(),
//     );
//   }
// }

//imagedisp.dart
// void main() {
//   runApp(const StopWatchRun());
// }   

// class StopWatchRun extends StatelessWidget {
//   const StopWatchRun({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ImageDisp(),
//     );
//   }
// }

//inputtextcontrol.dart
// void main() {
//   runApp(const StopWatchRun());
// }   

// class StopWatchRun extends StatelessWidget {
//   const StopWatchRun({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ControlInput(),
//     );
//   }
// }


//stopwatch.dart/login.dart
// void main() {
//   runApp(const StopWatchRun());
// }   

// class StopWatchRun extends StatelessWidget {
//   const StopWatchRun({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginScreen(),
//     );
//   }
// }

//calculator.dart
// void main() {
//   runApp(const CalculatorWidget());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CalculatorWidget(),
//     );
//   }
// }

//stopwatch.dart
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

//register.dart
// void main() {
//   runApp(const RegisterRun());
// }

// class RegisterRun extends StatelessWidget {
//   const RegisterRun({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: RegisterExercise(),
//     );
//   }
// }