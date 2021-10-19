import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter/model/pokemon_list_item.dart';
import 'package:pokemon_flutter/pages/pokemon_list/bloc/pokemon_list_event.dart';
import 'package:pokemon_flutter/pages/pokemon_list/bloc/pokemon_list_state.dart';
import 'package:pokemon_flutter/services/pokemon_exception.dart';
import 'package:pokemon_flutter/services/pokemon_service.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final PokemonService pokemonService;
  PokemonListBloc({required this.pokemonService}) : super(LoadingState()) {
    on<LoadFullList>((event, emit) => _mapPokemonListToState(event, emit));
    on<LoadPokemonDetails>((event, emit) => _mapPokemonDetailsToState(event, emit));
    add(LoadFullList());
  }

  void _mapPokemonListToState(LoadFullList event, Emitter<PokemonListState> emit) async {
    emit(LoadingState());
    try {
      List<PokemonListItemDetailed> detailedList = [];
      List<PokemonListItem> pokemonList = await pokemonService.loadPokemonList();
      pokemonList.removeRange(5, pokemonList.length);
      pokemonList.forEach((element) async {
        PokemonListItemDetailed pokemonDetails = await pokemonService.loadPokemonDetails(name: element.pokemonName);
        detailedList.add(pokemonDetails);
      });
      emit(PokemonListState(pokemonList: detailedList));
    } on PokemonException catch (e) {
      emit(ErrorState(message: e.message));
    }
  }

  void _mapPokemonDetailsToState(LoadPokemonDetails event, Emitter<PokemonListState> emit) async {

  }
}