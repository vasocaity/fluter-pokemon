import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        _buildTitle(),
        const SizedBox(height: 30),
        _buildImage(),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildTitle() {
    return Column(
      children: [
        Text(
          'Welcome To',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white.withOpacity(0.8), // Semi-transparent white
            fontWeight: FontWeight.w300, // Light font weight
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Pokedex',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFC107), // Pokemon yellow color
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return SizedBox(
      height: 200,
      child: Center(
        child: Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1), // Subtle background
            shape: BoxShape.circle, // Makes it circular
          ),
          child: const Center(
            child: Icon(
              Icons.catching_pokemon, // Pokemon-themed icon
              size: 80,
              color: Color(0xFFFFC107), // Same yellow as title
            ),
          ),
        ),
      ),
    );
  }
}
