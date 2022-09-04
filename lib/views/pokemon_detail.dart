import 'package:flutter/material.dart';

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
    return Text('');
  }
}
