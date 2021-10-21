class PokemonDetailsState {
  final String? description;
  final String? specie;
  final String? message;

  PokemonDetailsState({this.specie, this.description, this.message});
}

class CustomPokemonState extends PokemonDetailsState {}

class LoadingDetailsState extends PokemonDetailsState {}

class ErrorDetailsState extends PokemonDetailsState {
  ErrorDetailsState({required String errorMessage}) : super(message: errorMessage);
}