import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_app/widget/detail_text.dart';
import '../api/poke_api.dart';
import '../model/pokemon_attribute.dart';

class PokemonDetailPage extends StatefulWidget {
  final String url;
  final String tag;
  const PokemonDetailPage({Key? key, required this.url, required this.tag})
      : super(key: key);

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
            // data initialization from API
            final name = snapshot.data!.name;
            final weight = snapshot.data!.weight;
            final typeList = snapshot.data!.types;
            final pokeHeight = snapshot.data!.pokeHeight;
            final id = snapshot.data!.id;
            final order = snapshot.data!.order;
            final species = snapshot.data!.species!.name;
            final tag = snapshot.data.toString();

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
                              height: 12,
                            ),
                            Text(
                              'Details',
                              style: GoogleFonts.poppins(
                                  color: Colors.black, fontSize: 24),
                            ),
                            DetailText(
                              detail: 'Name',
                              info: name!.toUpperCase(),
                            ),
                            DetailText(
                              detail: 'Height',
                              info: '$pokeHeight m',
                            ),
                            DetailText(
                              detail: 'Weight',
                              info: '$weight Kg',
                            ),
                            DetailText(
                              detail: 'Order',
                              info: order.toString(),
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
        ;
      },
    );
  }
}
