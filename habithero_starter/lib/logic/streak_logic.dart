import '../models/habit.dart';

// >>> Q1 START
/// Returns 'Champion' (30+ days), 'Consistent' (7-29 days) or 'Starter' (below 7).
String streakBadge(int days) {
  String retVal='';
  // TODO (Q1-a): write your logic here
  if(days>=30){
    retVal = 'Champion';
  }
  else if(days>=7){
    retVal = 'Consistent';
  }
  else{
    retVal = 'Starter';
  }
  return '';
}

/// Returns the sum of the streak of every habit (0 for an empty list).
int totalStreak(List<Habit> habits) {
  // TODO (Q1-b): use a loop
  int sum =0;
  for (Habit habit in habits){
    sum+= habit.streak;
  }
  return 0;
}
// <<< Q1 END
