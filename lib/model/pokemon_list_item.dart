class PokemonListItem {
  final String url;
  final String pokemonName;

  PokemonListItem({required this.url, required this.pokemonName});

  PokemonListItem.fromContentResponse(Map content) :
      this.pokemonName = content['name'],
      this.url = content['url'];
}

class PokemonListItemDetailed {
  final String urlImage;
  final String pokemonName;
  final List<String> pokemonSkills;
  final List<String> pokemonType;

  PokemonListItemDetailed({
    required this.urlImage,
    required this.pokemonName,
    required this.pokemonSkills,
    required this.pokemonType,
  });

  PokemonListItemDetailed.fromContentResponse(Map content) :
      this.urlImage = content['sprites']['front_default'],
      this.pokemonName = content['species']['name'],
      this.pokemonSkills = [content['abilities'][0]['ability']['name']],
      this.pokemonType = [content['types'][0]['type']['name']];
}