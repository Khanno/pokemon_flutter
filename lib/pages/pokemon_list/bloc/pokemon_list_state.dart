import 'package:pokemon_flutter/model/pokemon_list_item.dart';

class PokemonListState {
  List<PokemonListItemDetailed>? pokemonList;
  String? errorMessage;

  PokemonListState({this.pokemonList, this.errorMessage});
}

class LoadingState extends PokemonListState {}

class LoadingInfoState extends PokemonListState {}

class ErrorState extends PokemonListState {
  ErrorState({required String message}) : super(errorMessage: message);
}
