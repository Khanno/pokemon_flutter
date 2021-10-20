class PokemonDetails {
  final String description;
  final String type;

  PokemonDetails({required this.description, required this.type});

  PokemonDetails.fromContentResponse(Map content) :
    this.type = content['egg_groups'][1]['name'],
    this.description = content['flavor_text_entries'][0]['flavor_text'];
}