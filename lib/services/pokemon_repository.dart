import 'package:dio/dio.dart';
import 'package:pokemon_flutter/services/pokemon_exception.dart';
import 'package:pokemon_flutter/services/pokemon_response.dart';

class PokemonRepository {
  final Dio dio;
  PokemonRepository({required this.dio});

  errorHandler(error) {
    throw PokemonException.fromMap(error);
  }

  Future<PokemonResponse> getPokemonList({required int pokemonId}) async {
    try {
      Response<dynamic> response = await dio.get('${dio.options.baseUrl}pokemon/$pokemonId');
      return PokemonResponse.fromResponse(data: response.data);
    } on DioError catch(e) {
      return errorHandler(e);
    }
  }

  Future<PokemonResponse> getPokemonDetails({required int index}) async {
    try {
      Response<dynamic> response = await dio.get('${dio.options.baseUrl}pokemon-species/$index');
      return PokemonResponse.fromResponse(data: response.data);
    } on DioError catch(e) {
      return errorHandler(e);
    }
  }

  Future<PokemonResponse> loadTypes() async {
    try {
      Response<dynamic> response = await dio.get('${dio.options.baseUrl}type');
      return PokemonResponse.fromResponse(data: response.data);
    } on DioError catch(e) {
      return errorHandler(e);
    }
  }

  Future<PokemonResponse> loadAbilities() async {
    try {
      Response<dynamic> response = await dio.get('${dio.options.baseUrl}ability');
      return PokemonResponse.fromResponse(data: response.data);
    } on DioError catch(e) {
      return errorHandler(e);
    }
  }

  Future<PokemonResponse> loadCategories() async {
    try {
      Response<dynamic> response = await dio.get('${dio.options.baseUrl}egg-group');
      return PokemonResponse.fromResponse(data: response.data);
    } on DioError catch(e) {
      return errorHandler(e);
    }
  }

}