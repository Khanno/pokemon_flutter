class PokemonListEvent {}

class LoadFullList extends PokemonListEvent {}

class LoadPokemonDetails extends PokemonListEvent {
  final String urlPokemon;
  LoadPokemonDetails({required this.urlPokemon});
}