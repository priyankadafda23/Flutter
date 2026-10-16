import '../models/habit.dart';

/// Habits shown on a fresh install.
List<Habit> defaultHabits() => [
      Habit(name: 'Drink Water', category: 'Health', streak: 12),
      Habit(name: 'Read 20 Pages', category: 'Study', streak: 7),
      Habit(name: 'Morning Walk', category: 'Health', streak: 3),
      Habit(name: 'Practice Flutter', category: 'Work', streak: 30),
    ];
