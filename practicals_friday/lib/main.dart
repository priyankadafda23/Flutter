import 'package:flutter/material.dart';
import 'screens/todo_screen.dart';
//import 'screens/counter_screen.dart';
//import 'screens/color_page.dart';

// for color_page and counter_screen.
// void main() {
//   runApp(const MainApp());
// }

// for todo_screen
void main(){
  runApp(ToDoWidget());
}

class ToDoWidget extends StatelessWidget{
  const ToDoWidget({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );
  }
}
// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

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
