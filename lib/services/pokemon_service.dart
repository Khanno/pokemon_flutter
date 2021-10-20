import 'package:dio/dio.dart';
import 'package:pokemon_flutter/model/pokemon_details.dart';
import 'package:pokemon_flutter/model/pokemon_list_item.dart';
import 'package:pokemon_flutter/services/pokemon_repository.dart';
import 'package:pokemon_flutter/services/pokemon_response.dart';

class PokemonService {

  PokemonRepository pokemonRepository = PokemonRepository(dio: Dio(BaseOptions(baseUrl: 'http://pokeapi.co/api/v2/')));

  Future<PokemonListItemDetailed> loadPokemonList({required int pokemonId}) async {
    PokemonResponse response = await pokemonRepository.getPokemonList(pokemonId: pokemonId);
    return PokemonListItemDetailed.fromContentResponse(response.content as Map);
  }

  Future<PokemonDetails> loadPokemonDetails({required int index}) async {
    PokemonResponse response = await pokemonRepository.getPokemonDetails(index: index);
    return PokemonDetails.fromContentResponse(response.content as Map);
  }
}