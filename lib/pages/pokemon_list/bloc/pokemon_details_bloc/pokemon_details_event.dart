class PokemonDetailsEvent {}

class LoadingDetailsEvent extends PokemonDetailsEvent {
  final int index;
  LoadingDetailsEvent({required this.index});
}