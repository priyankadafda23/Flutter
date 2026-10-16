import 'package:flutter/material.dart';

import 'widgets/stat_card.dart';

/// Preview for Q2.  Run with:  flutter run -t lib/q2_preview.dart
void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: StatCard(
            label: 'Total streak',
            value: '52',
            icon: Icons.local_fire_department,
          ),
        ),
      ),
    ),
  );
}
