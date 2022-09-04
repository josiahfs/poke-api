import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:poke_app/model/pokemon_list.dart';

import '../model/pokemon_attribute.dart';

class PokemonApi {
  static Future<PokemonIndex> fetchPokemon(int offset) async {
    final Uri url = Uri.parse(
        'https://pokeapi.co/api/v2/pokemon/?offset=${offset.toString()}&limit=100');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = PokemonIndex.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Error loading Pokemon!');
    }
  }

  Future<PokemonDetail> fetchDetailPokemon(url) async {
    final Uri page = Uri.parse(url);
    final response = await http.get(page);
    var data = PokemonDetail.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception('Error loading Pokemon!');
    }
  }
}
