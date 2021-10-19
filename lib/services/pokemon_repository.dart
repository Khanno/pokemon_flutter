import 'package:dio/dio.dart';
import 'package:pokemon_flutter/model/pokemon_list_item.dart';
import 'package:pokemon_flutter/services/pokemon_exception.dart';
import 'package:pokemon_flutter/services/pokemon_response.dart';

class PokemonRepository {
  final Dio dio;
  PokemonRepository({required this.dio});

  errorHandler(error) {
    throw PokemonException.fromMap(error);
  }

  Future<PokemonResponse> getPokemonList() async {
    try {
      Response<dynamic> response = await dio.get('${dio.options.baseUrl}pokedex/1');
      return PokemonResponse.fromResponse(data: response.data);
    } on DioError catch(e) {
      return errorHandler(e);
    }
  }

  Future<PokemonResponse> getPokemonDetails({required String name}) async {
    try {
      Response<dynamic> response = await dio.get('${dio.options.baseUrl}pokemon/$name');
      return PokemonResponse.fromResponse(data: response.data);
    } on DioError catch(e) {
      return errorHandler(e);
    }
  }
}