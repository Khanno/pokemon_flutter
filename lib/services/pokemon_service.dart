import 'package:dio/dio.dart';
import 'package:pokemon_flutter/model/pokemon_list_item.dart';
import 'package:pokemon_flutter/services/pokemon_repository.dart';
import 'package:pokemon_flutter/services/pokemon_response.dart';

class PokemonService {

  PokemonRepository pokemonRepository = PokemonRepository(dio: Dio(BaseOptions(baseUrl: 'http://pokeapi.co/api/v2/')));

  Future<List<PokemonListItem>> loadPokemonList() async {
    List<PokemonListItem> pokemonList = [];

    PokemonResponse response = await pokemonRepository.getPokemonList();

    if(response.content != null) {
      (response.content!['pokemon_entries'] as List).forEach((element) {
        PokemonListItem pokemon = PokemonListItem(url: element['pokemon_species']['url'], pokemonName: element['pokemon_species']['name']);
        pokemonList.add(pokemon);
      });
    }

    return pokemonList;
  }

  Future<PokemonListItemDetailed> loadPokemonDetails({required String name}) async {
    PokemonResponse response = await pokemonRepository.getPokemonDetails(name: name);
    return PokemonListItemDetailed.fromContentResponse(response.content as Map);
  }
}