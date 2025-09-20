import 'package:flutter/material.dart';
import 'core/constants/routes.dart';
import 'core/navigation/route_generator.dart';

void main() {
  runApp(const PokedexApp());
}

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 7, 7),
          // dynamicSchemeVariant: (),
          // brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
      initialRoute: Routes.splash, // Points to '/'
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
