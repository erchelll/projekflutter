import 'package:flutter/material.dart';
import 'main.dart';
import 'dashboard_screen.dart';
import 'profil_screen.dart';
import 'login_screen1.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _setDashboardTheme(BuildContext context) {
    // Dana style blue
    MyApp.of(context)?.updateTheme(
      ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF0057B7), // Dana blue
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0057B7)),
        brightness: Brightness.dark,
      ),
    );
  }

  void _setProfileTheme(BuildContext context) {
    // Slightly lighter Dana blue for profile
    MyApp.of(context)?.updateTheme(
      ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF0070E0), // lighter Dana blue
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0070E0)),
        brightness: Brightness.dark,
      ),
    );
  }

  void _logout(BuildContext context) {
    // Reset theme to login screen theme with white background and blue app bar
    MyApp.of(context)?.updateTheme(
      ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
        brightness: Brightness.light,
      ),
    );

    // Navigate to LoginScreen1 and clear all previous routes
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen1()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // white background for home
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Home Screen!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _setDashboardTheme(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardScreen(),
                  ),
                );
              },
              child: const Text('Go to Dashboard'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _setProfileTheme(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilScreen()),
                );
              },
              child: const Text('Go to Profile'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _logout(context), // Logout button
              child: const Text('Logout'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
