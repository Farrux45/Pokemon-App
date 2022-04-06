import 'package:flutter/material.dart';
import 'package:pokemon_app/model/model_pokemon.dart';
import 'package:pokemon_app/screens/about/about.dart';
import 'package:pokemon_app/screens/home_page_pokemon.dart';
import 'package:pokemon_app/screens/search/search_page.dart';

class RouteGenerator {
  static generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case '/about':
        return MaterialPageRoute(
          builder: (_) => AboutPage(),
          data: (args as Pokemon),
        );
      case '/search':
        return MaterialPageRoute(
          builder: (_) => SearchPage(),
          data: (args as List<Pokemon>),
        );
    }
  }
}
