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
