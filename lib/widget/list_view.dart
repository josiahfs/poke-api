import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
          ));
    }

    return NotificationListener<ScrollEndNotification>(
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: _pokemonList.length,
          itemBuilder: (context, index) {
            final name = widget.data[index].name;
            return Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  onTap: () {
                    checkPokemon(widget.data[index].url);
                  },
                  title: Center(
                    child: Column(
                      children: [
                        Image.network(widget.data[index].imageUrl),
                        Text(
                          '$name'.toUpperCase(),
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
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
