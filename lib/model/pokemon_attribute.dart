// To parse this JSON data, do
//
//     final pokemonDetails = pokemonDetailsFromJson(jsonString);

import 'dart:convert';

PokemonDetail pokemonDetailsFromJson(String str) =>
    PokemonDetail.fromJson(json.decode(str));

String pokemonDetailsToJson(PokemonDetail data) => json.encode(data.toJson());

class PokemonDetail {
  PokemonDetail({
    this.abilities,
    this.pokeHeight,
    this.id,
    this.isDefault,
    this.name,
    this.order,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  List<Ability>? abilities;

  int? pokeHeight;
  int? id;
  bool? isDefault;
  String? name;
  int? order;
  List<dynamic>? pastTypes;
  Species? species;
  Sprites? sprites;
  List<Stat>? stats;
  List<Type>? types;
  int? weight;

  factory PokemonDetail.fromJson(Map<String, dynamic> json) => PokemonDetail(
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromJson(x))),
        pokeHeight: json["height"],
        id: json["id"],
        isDefault: json["is_default"],
        name: json["name"],
        order: json["order"],
        species: Species.fromJson(json["sprites"]),
        sprites: Sprites.fromJson(json["sprites"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities!.map((x) => x.toJson())),
        "height": pokeHeight,
        "id": id,
        "is_default": isDefault,
        "name": name,
        "order": order,
        "past_types": List<dynamic>.from(pastTypes!.map((x) => x)),
        "species": species!.toJson(),
        "sprites": sprites!.toJson(),
        "stats": List<dynamic>.from(stats!.map((x) => x.toJson())),
        "types": List<dynamic>.from(types!.map((x) => x.toJson())),
        "weight": weight,
      };
}

class Ability {
  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  Species? ability;
  bool? isHidden;
  int? slot;

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "ability": ability?.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class Species {
  Species({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Sprites {
  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.animated,
    this.other,
  });

  String? backDefault;
  dynamic? backFemale;
  String? backShiny;
  dynamic? backShinyFemale;
  String? frontDefault;
  dynamic? frontFemale;
  String? frontShiny;
  dynamic? frontShinyFemale;
  Sprites? animated;
  Other? other;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        animated: json["animated"] == null
            ? null
            : Sprites.fromJson(json["animated"]),
        other: json["other"] == null ? null : Other.fromJson(json["other"]),
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "animated": animated == null ? null : animated?.toJson(),
        "other": other == null ? null : other?.toJson(),
      };
}

class Home {
  Home({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}

class Other {
  Other({
    this.officialArtwork,
  });

  OfficialArtwork? officialArtwork;

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
      );

  Map<String, dynamic> toJson() => {
        "official-artwork": officialArtwork?.toJson(),
      };
}

class OfficialArtwork {
  OfficialArtwork({
    this.frontDefault,
  });

  String? frontDefault;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json["front_default"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
      };
}

class Stat {
  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  int? baseStat;
  int? effort;
  Species? stat;

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat?.toJson(),
      };
}

class Type {
  Type({
    this.slot,
    this.type,
  });

  int? slot;
  Species? type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type?.toJson(),
      };
}

// class PokemonDetail {
//   int? id;
//   String? num;
//   String? name;
//   String? img;
//   List<Types>? type;
//   int? pokeHeight;
//   int? weight;
//   String? candy;
//   int? candyCount;
//   String? egg;
//   double? spawnChance;
//   double? avgSpawns;
//   String? spawnTime;
//   // List<double>? multipliers;
//   // List<String>? weaknesses;

//   PokemonDetail({
//     this.id,
//     this.num,
//     this.name,
//     this.img,
//     this.type,
//     this.pokeHeight,
//     this.weight,
//     this.candy,
//     this.candyCount,
//     this.egg,
//     this.spawnChance,
//     this.avgSpawns,
//     this.spawnTime,
//     // this.multipliers,
//     // this.weaknesses,
//   });

//   PokemonDetail.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     num = json['num'];
//     name = json['name'];
//     img = json['img'];
//     type = json['type'];
//     pokeHeight = json['height'];
//     weight = json['weight'];
//     candy = json['candy'];
//     candyCount = json['candy_count'];
//     egg = json['egg'];
//     spawnChance = json['spawn_chance'];
//     avgSpawns = json['avg_spawns'];
//     spawnTime = json['spawn_time'];
//     // multipliers = json['multipliers']?.cast<double>();
//     // weaknesses = json['weaknesses'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['num'] = this.num;
//     data['name'] = this.name;
//     data['img'] = this.img;
//     data['type'] = this.type;
//     data['height'] = this.pokeHeight;
//     data['weight'] = this.weight;
//     data['candy'] = this.candy;
//     data['candy_count'] = this.candyCount;
//     data['egg'] = this.egg;
//     data['spawn_chance'] = this.spawnChance;
//     data['avg_spawns'] = this.avgSpawns;
//     data['spawn_time'] = this.spawnTime;
//     // data['multipliers'] = this.multipliers;
//     // data['weaknesses'] = this.weaknesses;

//     return data;
//   }
// }

// class Types {
//   String types;
//   Types({
//     required this.types,
//   });

//   Types copyWith({
//     String? types,
//   }) {
//     return Types(
//       types: this.types,
//     );
//   }

//   factory Types.fromMap(Map<String, dynamic> map) {
//     return Types(
//       types: map['type']['name'],
//     );
//   }
// }
