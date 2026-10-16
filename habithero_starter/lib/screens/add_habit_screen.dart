import 'package:flutter/material.dart';

import '../models/habit.dart';

/// Form that creates a new [Habit] and returns it to the previous screen.
class AddHabitScreen extends StatefulWidget {
  const AddHabitScreen({super.key});

  @override
  State<AddHabitScreen> createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  final TextEditingController _nameCtrl = TextEditingController();
  String _category = 'Health';
  double _goal = 1;

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    // >>> Q5A2 START
    // TODO (Q5-A): validate the name, then return a Habit
    // <<< Q5A2 END
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Habit')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // >>> Q6A4 START
              // TODO (Q6-A): Hero flame icon goes here
              // <<< Q6A4 END
              TextField(
                key: const Key('habitNameField'),
                controller: _nameCtrl,
                decoration: const InputDecoration(
                  labelText: 'Habit name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // >>> Q5A1 START
              // TODO (Q5-A): 'Category' label + three Radio buttons (Health, Study, Work)
              // TODO (Q5-A): 'Daily goal: N time(s)' label + Slider (1 to 10, whole numbers)
              // <<< Q5A1 END
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
                  child: const Text('Add Habit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
