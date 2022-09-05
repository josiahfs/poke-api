import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_app/api/poke_api.dart';
import 'package:poke_app/model/pokemon_list.dart';
import 'package:poke_app/widget/drawer.dart';
import 'package:poke_app/views/pokemon_detail.dart';
import 'package:poke_app/widget/list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<PokemonIndex>? pokemonIndex;

  @override
  void initState() {
    super.initState();
    pokemonIndex = PokemonApi.fetchPokemon(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text(
          'Pokedex App',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
        ),
      ),
      body: FutureBuilder<PokemonIndex>(
        future: pokemonIndex,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              final data = snapshot.data!.pokemonList;

              return PokemonListView(
                data: data,
              );
            } else {
              return const Center(
                child: Text('No data found'),
              );
            }
          }
        },
      ),
    );
  }
}

// TextField(
//               // controller: controller,
//               decoration: InputDecoration(
//                   prefixIcon: const Icon(Icons.search),
//                   hintText: 'Search Pokemon'),
//             ),

Color getPokemonColor(String? type) {
  switch (type) {
    case "grass":
      return Colors.green;
      break;
    case "fire":
      return Colors.red;
      break;
    case "water":
      return Colors.blue;
      break;
    case "poison":
      return Colors.purple;
      break;
    case "psychic":
      return Colors.purple;
      break;
    case "normal":
      return Colors.brown;
      break;
    case "ground":
      return Color.fromARGB(225, 100, 66, 54);
      break;
    case "bug":
      return Color.fromARGB(255, 1, 88, 20);
      break;
    case "rock":
      return Color.fromARGB(255, 116, 116, 116);
      break;
    case "steel":
      return Color.fromARGB(255, 116, 116, 116);
      break;
    case "electric":
      return Color.fromARGB(255, 229, 233, 0);
      break;
    case "fairy":
      return Color.fromARGB(255, 203, 0, 221);
      break;
    case "ghost":
      return Color.fromARGB(255, 52, 0, 136);
      break;
    case "dragon":
      return Color.fromARGB(255, 52, 0, 136);
      break;
    default:
      return Colors.grey;
  }
}
