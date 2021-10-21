import 'package:pokemon_flutter/model/pokemon_list_item.dart';

class PokemonListState {
  List<PokemonListItemDetailed>? pokemonList;
  bool? showFavorites;
  String? errorMessage;

  PokemonListState({this.pokemonList, this.errorMessage, this.showFavorites = false,});

  PokemonListState copyWith({
    List<PokemonListItemDetailed>? pokemonList,
    bool? showFavorites,
    String? errorMessage,
  }) {
    return PokemonListState(
      pokemonList: pokemonList ?? this.pokemonList,
      showFavorites: showFavorites ?? this.showFavorites,
      errorMessage:  errorMessage ?? this.errorMessage,
    );
  }
}

class LoadingState extends PokemonListState {
  LoadingState({List<PokemonListItemDetailed>? pokemonList}) : super(pokemonList: pokemonList ?? []);
}

class LoadingInfoState extends PokemonListState {
  LoadingInfoState({List<PokemonListItemDetailed>? pokemonList}) : super(pokemonList: pokemonList ?? []);
}

class PokemonCreated extends PokemonListState {
  PokemonCreated({List<PokemonListItemDetailed>? pokemonList}) : super(pokemonList: pokemonList ?? []);
}

class ErrorState extends PokemonListState {
  ErrorState({required String message}) : super(errorMessage: message);
}
