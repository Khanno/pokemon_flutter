import 'dart:typed_data';

class NewPokemonState {
  List<String>? types;
  List<String>? abilities;
  List<String>? categories;
  String? name;
  String? type;
  String? ability;
  String? category;
  String? description;
  Uint8List? imageBytes;
  String? message;

  NewPokemonState({
    this.types,
    this.abilities,
    this.categories,
    this.message,
    this.imageBytes,
    this.type,
    this.category,
    this.ability,
    this.description,
    this.name,
  });

  NewPokemonState copyWith({
    List<String>? types,
    List<String>? abilities,
    List<String>? categories,
    String? name,
    String? type,
    String? ability,
    String? category,
    String? description,
    Uint8List? imageBytes,
    String? message,
  }) {
    return NewPokemonState(
      types: types ?? this.types,
      message: message ?? this.message,
      category: category ?? this.category,
      type: type ?? this.type,
      description: description ?? this.description,
      name: name ?? this.name,
      abilities: abilities ?? this.abilities,
      ability: ability ?? this.ability,
      categories: categories ?? this.categories,
      imageBytes: imageBytes ?? this.imageBytes,
    );
  }
}

class LoadingDropdownButtons extends NewPokemonState {}

class ErrorState extends NewPokemonState {
  ErrorState({String? message}) : super(message: message);
}