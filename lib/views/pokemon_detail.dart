import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_app/widget/card_colors.dart';

import '../api/poke_api.dart';
import '../model/pokemon_attribute.dart';

class PokemonDetailPage extends StatefulWidget {
  final String url;
  const PokemonDetailPage({Key? key, required this.url}) : super(key: key);

  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetailPage> {
  Future<PokemonDetail>? pokemonIndex;

  @override
  void initState() {
    super.initState();
    pokemonIndex = PokemonApi().fetchDetailPokemon(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return FutureBuilder<PokemonDetail>(
      future: pokemonIndex,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (snapshot.hasData) {
            // data
            final name = snapshot.data!.name;
            final weight = snapshot.data!.weight;
            final type = snapshot.data!.types;
            final pokeHeight = snapshot.data!.pokeHeight;
            final id = snapshot.data!.id;

            return Scaffold(
              backgroundColor: Colors.amber,
              // backgroundColor: pokemonTypeMap[type],
              body: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 20,
                    left: 5,
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {
                          Get.back();
                        }),
                  ),
                  Positioned(
                      top: 70,
                      left: 20,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$name'.toUpperCase(),
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "#" + id.toString(),
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )),
                  Positioned(
                      top: 110,
                      left: 22,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            type.toString(),
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 15),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      )),
                  Positioned(
                    top: height * 0.18,
                    right: -30,
                    child: Image.asset(
                      'assets/pokeball-bg.png',
                      height: 200,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: width,
                      height: height * 0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: width * 0.3,
                                    child: Text(
                                      'Name',
                                      style: GoogleFonts.poppins(
                                          color: Colors.blueGrey, fontSize: 17),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '$name'.toUpperCase(),
                                      style: GoogleFonts.poppins(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: width * 0.3,
                                    child: Text(
                                      'Height',
                                      style: GoogleFonts.poppins(
                                          color: Colors.blueGrey, fontSize: 17),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '$pokeHeight',
                                      style: GoogleFonts.poppins(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: width * 0.3,
                                    child: Text(
                                      'Weight',
                                      style: GoogleFonts.poppins(
                                          color: Colors.blueGrey, fontSize: 17),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '$weight',
                                      style: GoogleFonts.poppins(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: (height * 0.2),
                    left: (width / 2) - 100,
                    child: Hero(
                      tag: id!,
                      child: Image.network(
                        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png",
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            // eror
            return const Scaffold(
              body: Center(
                child: Text('No Data Found'),
              ),
            );
          }
        }
      },
    );
  }
}
