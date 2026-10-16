import 'package:flutter/material.dart';

// >>> Q6RI START
import 'screens/home_screen.dart';
// <<< Q6RI END

void main() {
  runApp(const HabitHeroApp());
}

/// Root widget: theme and routes of HabitHero.
class HabitHeroApp extends StatelessWidget {
  const HabitHeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HabitHero',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.deepPurple, useMaterial3: true),
      // >>> Q6R START
      home: const HomeScreen(),
      // <<< Q6R END
    );
  }
}
