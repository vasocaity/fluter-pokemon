import 'package:flutter/material.dart';

class LoginBottom extends StatelessWidget {
  final bool isLoginMode;
  final VoidCallback onToggleMode;

  const LoginBottom({
    super.key,
    required this.isLoginMode,
    required this.onToggleMode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLoginMode ? "Don't have an account? " : "Already have an account? ",
          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
        ),
        TextButton(
          onPressed: onToggleMode,
          child: Text(
            isLoginMode ? 'Sign Up' : 'Login',
            style: const TextStyle(
              color: Color(0xFFFFC107),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
