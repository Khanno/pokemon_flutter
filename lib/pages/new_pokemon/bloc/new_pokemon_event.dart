import 'dart:typed_data';

class NewPokemonEvent {}

class LoadingContentEvent extends NewPokemonEvent {}

class SetImageEvent extends NewPokemonEvent {
  final Uint8List imageBytes;
  SetImageEvent({required this.imageBytes});
}

class SetPokemonNameEvent extends NewPokemonEvent {
  final String pokemonName;
  SetPokemonNameEvent({required this.pokemonName});
}

class SetPokemonCategoryEvent extends NewPokemonEvent {
  final String pokemonCategory;
  SetPokemonCategoryEvent({required this.pokemonCategory});
}

class SetPokemonTypeEvent extends NewPokemonEvent {
  final String pokemonType;
  SetPokemonTypeEvent({required this.pokemonType});
}

class SetPokemonAbilityEvent extends NewPokemonEvent {
  final String pokemonAbility;
  SetPokemonAbilityEvent({required this.pokemonAbility});
}

class SetPokemonDescriptionEvent extends NewPokemonEvent {
  final String pokemonDescription;
  SetPokemonDescriptionEvent({required this.pokemonDescription});
}