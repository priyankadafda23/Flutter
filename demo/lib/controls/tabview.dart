import 'package:flutter/material.dart';

class TabViewExample extends StatefulWidget {
  const TabViewExample({super.key});

  @override
  State<TabViewExample> createState() => _TabViewExampleState();
}

class _TabViewExampleState extends State<TabViewExample> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab View Example'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
              Tab(icon: Icon(Icons.play_arrow), text: 'Play'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Home Tab')),
            Center(child: Text('Settings Tab')),
            Center(child: Text('Play Tab')),
          ],
        ),
      ),
    );
  }
}