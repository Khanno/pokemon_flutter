import 'dart:typed_data';

class PokemonListItemDetailed {
  final String urlImage;
  final String pokemonName;
  final String pokemonSkills;
  final String pokemonType;
  bool isFavorite;
  bool isCustom;
  String? customSpecie;
  String? customDescription;
  Uint8List? customImage;

  PokemonListItemDetailed({
    required this.urlImage,
    required this.pokemonName,
    required this.pokemonSkills,
    required this.pokemonType,
    required this.isFavorite,
    required this.isCustom,
    this.customDescription,
    this.customSpecie,
    this.customImage,
  });

  PokemonListItemDetailed.fromContentResponse(Map content) :
      this.urlImage = content['sprites']['front_default'],
      this.pokemonName = content['name'],
      this.pokemonSkills = content['abilities'][0]['ability']['name'],
      this.pokemonType = content['types'][0]['type']['name'],
      this.isFavorite = false,
      this.isCustom = false,
      this.customDescription = null,
      this.customSpecie = null,
      this.customImage = null;
}