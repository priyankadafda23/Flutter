import 'package:flutter/material.dart';

import '../logic/streak_logic.dart';
import '../models/habit.dart';

/// One row of the habit list: icon, name, streak text and a checkbox.
class HabitTile extends StatelessWidget {
  const HabitTile({
    super.key,
    required this.habit,
    required this.onChanged,
    this.onTap,
    this.onLongPress,
  });

  final Habit habit;
  final ValueChanged<bool?> onChanged;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        onTap: onTap,
        onLongPress: onLongPress,
        leading: const Icon(Icons.local_fire_department, color: Colors.orange),
        title: Text(
          habit.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle:
            Text('${habit.streak} day streak · ${streakBadge(habit.streak)}'),
        trailing: Checkbox(value: habit.done, onChanged: onChanged),
      ),
    );
  }
}
