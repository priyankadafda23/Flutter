import 'package:flutter/material.dart';

import '../data/default_habits.dart';
import '../models/habit.dart';
import '../services/habit_storage.dart';
import '../widgets/habit_tile.dart';
import '../widgets/header_card.dart';
// >>> Q6A2I START
import 'add_habit_screen.dart';
// <<< Q6A2I END
import 'profile_page.dart';

/// Main screen: greeting card, today's progress and the habit list.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HabitStorage _storage = HabitStorage();
  final List<Habit> habits = defaultHabits();
  final Set<String> _defaultNames =
      defaultHabits().map((habit) => habit.name).toSet();

  /// Habits created by the user (everything that is not a default habit).
  List<Habit> get _customHabits =>
      habits.where((h) => !_defaultNames.contains(h.name)).toList();

  // ---------------------------------------------------------------- state
  // >>> Q4b START
  void _onToggle(Habit habit, bool? value) {
    habit.done = value!;
    habit.streak++;
    setState(() {
      
    });
  }
  // <<< Q4b END

  // ---------------------------------------------------------- persistence
  // >>> Q7W START
  @override
  void initState() {
    super.initState();
    // TODO (Q7): start loading the saved data here
  }

  Future<void> _load() async {
    // TODO (Q7-A / Q7-B): load the saved data, then refresh the screen
  }

  Future<void> _persistProgress() async {
    // TODO (Q7-A): save the progress
  }

  Future<void> _resetDay() async {
    // TODO (Q7-A): ask for confirmation (see _askConfirmation), then clear the ticks
  }

  void _onHabitAdded(Habit habit) {
    setState(() => habits.add(habit));
    // TODO (Q7-B): save the custom habits
  }

  Future<void> _confirmDelete(Habit habit) async {
    // TODO (Q7-B): delete a custom habit after confirmation
  }
  // <<< Q7W END

  /// Shows a Cancel / confirm dialog and returns true when confirmed.
  Future<bool> _askConfirmation({
    required String title,
    required String message,
    required String confirmLabel,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(confirmLabel),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  // ----------------------------------------------------------- navigation
  Future<void> _openAddScreen() async {
    // >>> Q6A2 START
    final result = await Navigator.push(
      context,
      MaterialPageRoute<Habit>(builder: (_) => const AddHabitScreen()),
    );
    // <<< Q6A2 END
    if (result is Habit) _onHabitAdded(result);
  }

  void _openProfile() {
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (_) => const ProfilePage()),
    );
  }

  Widget? _buildDrawer() {
    // >>> Q6B1 START
    return null; // TODO (Q6-B): build the Drawer here
    // <<< Q6B1 END
  }

  // ----------------------------------------------------------------- view
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('HabitHero'),
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle),
          tooltip: 'Edit profile',
          onPressed: _openProfile,
        ),
        IconButton(
          icon: const Icon(Icons.restart_alt),
          tooltip: 'Reset day',
          onPressed: _resetDay,
        ),
      ],
    );
  }

  Widget _buildProgress(int completed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Today's progress: $completed / ${habits.length}"),
          const SizedBox(height: 6),
          LinearProgressIndicator(
            value: habits.isEmpty ? 0 : completed / habits.length,
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    return ListView(
      children: [
        for (final habit in habits)
          HabitTile(
            habit: habit,
            onChanged: (value) => _onToggle(habit, value),
            // >>> Q6B2 START
            // TODO (Q6-B): open '/detail' and pass the habit as argument
            // <<< Q6B2 END
            onLongPress: () => _confirmDelete(habit),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // >>> Q4a START
    int completed = 0;
    // <<< Q4a END
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            const HeaderCard(),
            _buildProgress(completed),
            const SizedBox(height: 8),
            Expanded(child: _buildList()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddScreen,
        child: const Icon(Icons.add),
      ),
    );
  }
}
