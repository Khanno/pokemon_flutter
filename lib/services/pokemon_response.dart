class PokemonResponse {
  final Map? content;

  PokemonResponse({this.content});

  PokemonResponse.fromResponse({required Map data}) :
      this.content = data;
}