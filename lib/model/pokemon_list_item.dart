class PokemonListItemDetailed {
  final String urlImage;
  final String pokemonName;
  final String pokemonSkills;
  final String pokemonType;
  bool isFavorite;

  PokemonListItemDetailed({
    required this.urlImage,
    required this.pokemonName,
    required this.pokemonSkills,
    required this.pokemonType,
    required this.isFavorite,
  });

  PokemonListItemDetailed.fromContentResponse(Map content) :
      this.urlImage = content['sprites']['front_default'],
      this.pokemonName = content['name'],
      this.pokemonSkills = content['abilities'][0]['ability']['name'],
      this.pokemonType = content['types'][0]['type']['name'],
      this.isFavorite = false;
}