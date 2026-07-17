import 'package:flutter/material.dart';
import 'screens/counter_screen.dart';
//import 'color_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      colorScheme: .fromSeed(seedColor:Colors.deepPurple),),
      home: CounterScreen(),
    );
  }

  //color_page
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: ColorPage(),
  //   );
  // }
}
