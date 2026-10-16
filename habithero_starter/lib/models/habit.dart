/// A habit the user wants to repeat every day.
class Habit {
  Habit({
    required this.name,
    this.category = 'Health',
    this.goal = 1,
    this.streak = 0,
    this.done = false,
  });

  final String name;
  final String category;

  /// How many times per day the habit should be done (1-10).
  final int goal;

  /// Number of days in a row the habit was completed.
  int streak;

  /// Whether the habit is ticked for today.
  bool done;
}
