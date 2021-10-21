import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter/pages/dashboard/dashboard_page.dart';
import 'package:pokemon_flutter/pages/new_pokemon/bloc/new_pokemon_bloc.dart';
import 'package:pokemon_flutter/pages/new_pokemon/new_pokemon_page.dart';
import 'package:pokemon_flutter/pages/pokemon_list/bloc/pokemon_list_bloc/pokemon_list_bloc.dart';
import 'package:pokemon_flutter/pages/pokemon_list/pokemon_list_page.dart';
import 'package:pokemon_flutter/services/pokemon_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PokemonListBloc(pokemonService: PokemonService()),
      child: MaterialApp(
        routes: {
          '/': (context) => DashboardPage(),
          '/pokemon-list': (context) => PokemonListPage(),
          '/new-pokemon': (context) => BlocProvider(
            create: (_) => NewPokemonBloc(pokemonService: PokemonService()),
            child: NewPokemonPage()),
        },
      ),
    );
  }
}
