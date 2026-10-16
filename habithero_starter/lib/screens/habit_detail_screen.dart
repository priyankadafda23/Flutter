import 'package:flutter/material.dart';

import '../logic/streak_logic.dart';
import '../models/habit.dart';

/// Details of one habit; the habit is passed as route argument.
class HabitDetailScreen extends StatelessWidget {
  const HabitDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final habit = ModalRoute.of(context)!.settings.arguments as Habit;
    // >>> Q6B3 START
    return Scaffold(
      appBar: AppBar(title: Text(habit.name)),
      body: const Center(child: Text('TODO (Q6-B): tabs')),
    );
    // <<< Q6B3 END
  }
}
