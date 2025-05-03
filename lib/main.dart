import 'package:flutter/material.dart';
import 'login_screen1.dart';
import 'home_screen.dart';
import 'dashboard_screen.dart';
import 'profil_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen1(), // Start with the LoginScreen1
      routes: {
        '/home': (context) => const HomeScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/profil': (context) => const ProfilScreen(),
      },
    );
  }
}
