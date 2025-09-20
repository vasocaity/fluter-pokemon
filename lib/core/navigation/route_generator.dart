import 'package:flutter/material.dart';
import 'package:pokedex/features/login/login_screen.dart';
import 'package:pokedex/pokemon_list_screen.dart';
import '../../detail_screen.dart';
import '../constants/routes.dart';
import '../../features/splash/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _createRoute(const SplashScreen());
      case Routes.login:
        return _createRoute(const LoginScreen());
      case Routes.pokemonList:
        return _createRoute(const PokemonListScreen());
      case Routes.pokemonDetail:
        return _createRoute(DetailScreen(id: settings.arguments as int));
      default:
        return _createRoute(const SplashScreen());
    }
  }

  static PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
