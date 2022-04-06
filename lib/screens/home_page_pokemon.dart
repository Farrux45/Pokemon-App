import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/model/model_pokemon.dart';
import 'package:pokemon_app/service/service_pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pokemon> pData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.asset("assets/images/pokemon.png"),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: InkWell(
                  onTap: () async {
                    List<Pokemon>? data;
                    await ServicePokemon.getData()
                        .then((value) => data = value.pokemon);
                    Navigator.pushNamed(context, "/search", arguments: data);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
