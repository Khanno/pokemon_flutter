import 'package:pokemon_flutter/model/pokemon_list_item.dart';

class PokemonListState {
  List<PokemonListItemDetailed>? pokemonList;
  String? errorMessage;

  PokemonListState({this.pokemonList, this.errorMessage});

  PokemonListState copyWith({
    List<PokemonListItemDetailed>? pokemonList,
    String? errorMessage,
  }) {
    return PokemonListState(
      pokemonList: pokemonList ?? this.pokemonList,
      errorMessage:  errorMessage ?? this.errorMessage,
    );
  }
}

class LoadingState extends PokemonListState {}

class LoadingInfoState extends PokemonListState {}

class ErrorState extends PokemonListState {
  ErrorState({required String message}) : super(errorMessage: message);
}
