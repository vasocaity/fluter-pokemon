import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/constants/routes.dart'; // Add this import

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    // Wait for 3 seconds to show the splash animation
    await Future.delayed(const Duration(milliseconds: 3000));

    // Check if the widget is still mounted before navigating
    if (!mounted) return;

    // Navigate to login screen and remove splash from back stack
    Navigator.pushReplacementNamed(context, Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1A1B2E), Color(0xFF16213E), Color(0xFF0F3460)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Center(
              child: SizedBox(
                height: 150,
                width: 150,
                child: Lottie.asset('assets/pokeball_animation.json'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
