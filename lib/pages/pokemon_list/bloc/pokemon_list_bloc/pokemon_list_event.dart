import 'package:pokemon_flutter/model/pokemon_list_item.dart';

class PokemonListEvent {}

class LoadFullList extends PokemonListEvent {}

class SetFavoriteEvent extends PokemonListEvent {
  final int index;
  SetFavoriteEvent({required this.index});
}

class CreateNewPokemonEvent extends PokemonListEvent {
  final PokemonListItemDetailed newPokemon;
  CreateNewPokemonEvent({required this.newPokemon});
}

class ShowFavoritesEvent extends PokemonListEvent {
  final bool showFavorite;
  ShowFavoritesEvent({required this.showFavorite});
}