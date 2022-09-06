import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_app/api/poke_api.dart';
import 'package:poke_app/model/pokemon_list.dart';
import 'package:poke_app/views/pokemon_detail.dart';

class PokemonListView extends StatefulWidget {
  final dynamic data;
  const PokemonListView({Key? key, this.data}) : super(key: key);

  @override
  State<PokemonListView> createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  int currOffset = 0;
  List<PokemonName> _pokemonList = List.empty(growable: true);
  @override
  void initState() {
    _pokemonList = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    checkPokemon(url) {
      Get.to(() => PokemonDetailPage(
            url: url,
            tag: widget.data.toString(),
          ));
    }

    return NotificationListener<ScrollEndNotification>(
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.3),
          itemCount: _pokemonList.length,
          itemBuilder: (context, index) {
            final name = widget.data[index].name;
            return Card(
                color: Colors.blueGrey,
                child: InkWell(
                  onTap: () {
                    checkPokemon(widget.data[index].url);
                  },
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: -10,
                        right: -10,
                        child: Image.asset(
                          'assets/pokeball-bg.png',
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Text(
                          '$name'.toUpperCase(),
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: Hero(
                          tag: widget.data[index].id,
                          child: Image.network(
                            widget.data[index].imageUrl,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          }),
      onNotification: (notification) {
        if (currOffset <= 900) {
          currOffset += 50;
          PokemonApi.fetchPokemon(currOffset).then(
            (value) {
              setState(() {
                _pokemonList.addAll(value.pokemonList);
              });
            },
          );
        }
        return true;
      },
    );
  }
}
