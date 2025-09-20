class Routes {
  static const String splash = '/';
  static const String login = '/login';
  static const String pokemonList = '/pokemon-list';
  static const String pokemonDetail = '/pokemon-detail';

  static List<String> get allRoutes => [
    splash,
    login,
    pokemonList,
    pokemonDetail,
  ];
}
