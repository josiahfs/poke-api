import 'package:poke_app/api/poke_api.dart';

class PokemonIndex {
  List<PokemonName> pokemonList = List.empty(growable: true);

  PokemonIndex({required this.pokemonList});

  PokemonIndex.fromJson(Map<String, dynamic> json) {
    pokemonList = <PokemonName>[];
    json['results'].forEach((item) {
      pokemonList.add(PokemonName.fromJson(item));
    });
  }
}

class PokemonName {
  int? id;
  String? name;
  String? url;

  PokemonName({this.name, this.url});

  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$id.png';

  PokemonName.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'] as String;
    id = int.parse(url!.split('/')[6]);
  }
}
