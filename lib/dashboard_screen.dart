import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color and appbar color come from theme
      appBar: AppBar(title: const Text('Dashboard')),
      body: const Center(
        child: Text(
          'This is the Dashboard Screen!',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
