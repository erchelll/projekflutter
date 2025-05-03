import 'package:flutter/material.dart';
import 'main.dart';

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({super.key});

  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  bool passwordVisible = true;
  bool isLogin = true; // Toggle between login and registration

  // Simple in-memory storage for user credentials
  String? registeredEmail;
  String? registeredPassword;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController regEmailController = TextEditingController();
  final TextEditingController regPasswordController = TextEditingController();

  void togglePasswordVisibility() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  void toggleForm() {
    setState(() {
      isLogin = !isLogin;
      // Clear fields on toggle
      emailController.clear();
      passwordController.clear();
      regEmailController.clear();
      regPasswordController.clear();
    });
  }

  void register() {
    final email = regEmailController.text.trim();
    final password = regPasswordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }
    // Save credentials
    registeredEmail = email;
    registeredPassword = password;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registration successful! Please login.')),
    );

    // Switch to login form after registration
    toggleForm();
  }

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (registeredEmail == null || registeredPassword == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No registered account. Please register first.'),
        ),
      );
      return;
    }

    if (email == registeredEmail && password == registeredPassword) {
      // Set theme and navigate to home
      MyApp.of(context)?.updateTheme(
        ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
        ),
      );
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // white background for login/registration
      appBar: AppBar(title: Text(isLogin ? 'Login' : 'Register')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: isLogin ? _buildLoginForm() : _buildRegisterForm(),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20),
        TextField(
          controller: passwordController,
          obscureText: passwordVisible,
          decoration: InputDecoration(
            labelText: 'Password',
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                passwordVisible ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: togglePasswordVisibility,
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: login, child: const Text('Login')),
        const SizedBox(height: 10),
        TextButton(
          onPressed: toggleForm,
          child: const Text('Don\'t have an account? Register here'),
        ),
      ],
    );
  }

  Widget _buildRegisterForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: regEmailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20),
        TextField(
          controller: regPasswordController,
          obscureText: passwordVisible,
          decoration: InputDecoration(
            labelText: 'Password',
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                passwordVisible ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: togglePasswordVisibility,
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: register, child: const Text('Register')),
        const SizedBox(height: 10),
        TextButton(
          onPressed: toggleForm,
          child: const Text('Already have an account? Login here'),
        ),
      ],
    );
  }
}
