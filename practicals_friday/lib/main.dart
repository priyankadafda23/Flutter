import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
//import 'screens/todo_screen.dart';
//import 'screens/track.dart';
//import 'screens/counter_screen.dart';
//import 'screens/color_page.dart';

void main() {
  runApp(const CountApp());
}

class CountApp extends StatelessWidget {
  const CountApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


//for track.dart
// void main() {
//   runApp(const ExpenseTrackerApp());
// }

// class ExpenseTrackerApp extends StatelessWidget {
//   const ExpenseTrackerApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Income & Expense Tracker",
//       theme: ThemeData(
//         colorSchemeSeed: Colors.green,
//         useMaterial3: true,
//       ),
//       home: const TrackPage(),
//     );
//   }
// }


// for color_page and counter_screen.
// void main() {
//   runApp(const MainApp());
// }


  // counter_screen
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeData(
  //     colorScheme: .fromSeed(seedColor:Colors.deepPurple),),
  //     home: CounterScreen(),
  //   );
  // }


  //color_page
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: ColorPage(),
  //   );
  // }
// }


// for todo_screen
// void main(){
//   runApp(ToDoWidget());
// }

// class ToDoWidget extends StatelessWidget{
//   const ToDoWidget({super.key});

//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: TodoScreen(),
//     );
//   }
// }
// class MainApp extends StatelessWidget {
//   const MainApp({super.key});