import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color and appbar color come from theme
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(
        child: Text(
          'This is your Profile Screen!',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
