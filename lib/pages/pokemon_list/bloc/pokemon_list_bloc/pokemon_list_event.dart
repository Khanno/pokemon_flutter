class PokemonListEvent {}

class LoadFullList extends PokemonListEvent {}

class SetFavoriteEvent extends PokemonListEvent {
  final int index;
  SetFavoriteEvent({required this.index});
}