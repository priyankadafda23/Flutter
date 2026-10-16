import 'package:flutter/material.dart';

/// Profile and preference form.
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameCtrl = TextEditingController();
  String _greetingName = 'Hero';
  bool _dailyReminder = false;
  bool _weeklyReport = false;
  bool _sound = false;
  double _target = 3;
  String _summary = '';

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  void _save() {
    // >>> Q5B2 START
    // TODO (Q5-B): validate the name, update greeting and summary
    // <<< Q5B2 END
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, $_greetingName!',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // >>> Q5B1 START
              // TODO (Q5-B): name TextField, three CheckboxListTiles, target Slider
              // <<< Q5B1 END
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _save,
                  child: const Text('Save Profile'),
                ),
              ),
              if (_summary.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(_summary),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
