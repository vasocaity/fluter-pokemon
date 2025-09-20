import 'package:flutter/material.dart';
import 'package:pokedex/features/login/widgets/login_bottom.dart';
import 'package:pokedex/features/login/widgets/login_form.dart';
import 'package:pokedex/features/login/widgets/login_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  // ... existing controllers and variables ...

  @override
  void initState() {
    super.initState();

    // Set up animation controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this, // 'this' works because of SingleTickerProviderStateMixin
    );

    // Create fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut, // Smooth animation curve
      ),
    );

    // Start the animation
    _animationController.forward();
  }

  // Controllers to manage text input
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // State variable to track current mode
  bool _isLoginMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A1B2E), // Dark blue
              Color(0xFF16213E), // Medium blue
              Color.fromARGB(255, 16, 53, 40), // Deep blue
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LoginHeader(),
                  // LoginForm(
                  //   isLoginMode: _isLoginMode,
                  //   emailController: _emailController,
                  //   passwordController: _passwordController,
                  //   confirmPasswordController: _confirmPasswordController,
                  //   onLoginSuccess: _handleLoginSuccess,
                  //   onSignUpSuccess: _handleSignUpSuccess,
                  // ),
                  // In your build method, replace LoginForm with:
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: LoginForm(
                      isLoginMode: _isLoginMode,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      confirmPasswordController: _confirmPasswordController,
                      onLoginSuccess: _handleLoginSuccess,
                      onSignUpSuccess: _handleSignUpSuccess,
                    ),
                  ),
                  const SizedBox(height: 30),
                  LoginBottom(
                    isLoginMode: _isLoginMode,
                    onToggleMode: _toggleMode,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Add this method to handle mode switching
  void _toggleMode() {
    setState(() {
      _isLoginMode = !_isLoginMode;
      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
    });

    // Animate the form change
    _animationController.reset();
    _animationController.forward();
  }

  // Handle successful login
  void _handleLoginSuccess(String email) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Login successful: $email'),
        backgroundColor: const Color(0xFFFFC107),
        behavior: SnackBarBehavior.floating,
      ),
    );
    // TODO: Navigate to next screen
    Navigator.pushReplacementNamed(context, '/pokemon-list');
  }

  // Handle successful signup
  void _handleSignUpSuccess(String email) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Account created: $email'),
        backgroundColor: const Color(0xFFFFC107),
        behavior: SnackBarBehavior.floating,
      ),
    );
    // Automatically switch to login mode after signup
    setState(() {
      _isLoginMode = true;
    });
  }

  // Don't forget to dispose controllers to prevent memory leaks
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _animationController.dispose(); // Don't forget this!
    super.dispose();
  }
}
