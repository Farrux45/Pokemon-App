import 'package:flutter/material.dart';
import 'package:pokemon_app/model/model_pokemon.dart';
import 'package:pokemon_app/service/service_pokemon.dart';

class AboutPage extends StatelessWidget {
  AboutPage({Key? key, required this.data}) : super(key: key);

  Pokemon data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              height: MediaQuery.of(context).size.height * 0.15,
              child: Image.asset("assets/images/pokemon.png"),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.keyboard_arrow_left_outlined),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      List<Pokemon>? data;
                      await ServicePokemon.getData()
                          .then((value) => data = value.pokemon);
                      Navigator.pushNamed(context, '/search', arguments: data);
                    },
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      enabled: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        hintText: "Buscar Pokemon",
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.segment_outlined),
                  ),
                ),
              ],
            ),
            Stack(children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 60, 20, 10),
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  color: Color(0xFFFC7FCC),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              Positioned(
                top: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "#" + data.num.toString(),
                        style: const TextStyle(
                          color: Color(0xFFFC7CFF),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}