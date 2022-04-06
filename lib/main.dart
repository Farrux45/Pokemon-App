import 'package:flutter/material.dart';
import 'package:pokemon_app/route/route_page.dart';
import 'package:pokemon_app/screens/home_page_pokemon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
    );
  }
}

