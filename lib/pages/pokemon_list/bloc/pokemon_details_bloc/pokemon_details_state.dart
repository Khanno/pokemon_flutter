class PokemonDetailsState {
  final String? description;
  final String? type;
  final String? message;

  PokemonDetailsState({this.type, this.description, this.message});
}

class LoadingDetailsState extends PokemonDetailsState {}

class ErrorDetailsState extends PokemonDetailsState {
  ErrorDetailsState({required String errorMessage}) : super(message: errorMessage);
}