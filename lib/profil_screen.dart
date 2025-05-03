import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: const Text(
          'This is your Profile Screen!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
