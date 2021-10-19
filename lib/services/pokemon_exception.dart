class PokemonException {
  final String code;
  final String message;

  PokemonException(this.code, this.message);

  PokemonException.fromMap(Map map) :
      this.code = map['code'] ?? map['error'] ?? 'XX',
      this.message = map['message'] ?? map['error_description'];
}