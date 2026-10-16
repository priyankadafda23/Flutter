import 'package:shared_preferences/shared_preferences.dart';

import '../logic/date_helper.dart';
import '../models/habit.dart';

/// Reads and writes HabitHero data as key-value pairs (SharedPreferences).
class HabitStorage {
  static const String doneKey = 'done';
  static const String lastDateKey = 'lastDate';
  static const String customKey = 'custom';

  /// Key that stores the streak of one habit, e.g. `streak_Drink Water`.
  static String streakKey(String habitName) => 'streak_$habitName';

  // >>> Q7A1 START
  Future<void> saveProgress(List<Habit> habits) async {
    // TODO (Q7-A): save the done habits, every streak and today's date
  }

  Future<void> loadProgress(List<Habit> habits) async {
    // TODO (Q7-A): read the saved values (new-day rule included)
  }
  // <<< Q7A1 END

  // >>> Q7B1 START
  static String encode(Habit habit) {
    // TODO (Q7-B): 'name|category|goal'
    return '';
  }

  static Habit? decode(String text) {
    // TODO (Q7-B): parse and validate; null when invalid
    return null;
  }

  Future<void> saveCustomHabits(List<Habit> customs) async {
    // TODO (Q7-B)
  }

  Future<List<Habit>> loadCustomHabits() async {
    // TODO (Q7-B)
    return [];
  }
  // <<< Q7B1 END
}
