import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter/model/pokemon_details.dart';
import 'package:pokemon_flutter/pages/pokemon_list/bloc/pokemon_details_bloc/pokemon_details_event.dart';
import 'package:pokemon_flutter/pages/pokemon_list/bloc/pokemon_details_bloc/pokemon_details_state.dart';
import 'package:pokemon_flutter/services/pokemon_exception.dart';
import 'package:pokemon_flutter/services/pokemon_service.dart';

class PokemonDetailsBloc extends Bloc<PokemonDetailsEvent, PokemonDetailsState>{
  final PokemonService pokemonService;
  final int index;
  PokemonDetailsBloc({required this.pokemonService, required this.index}) : super(LoadingDetailsState()) {
    on<LoadingDetailsEvent>((event, emit) => _loadDetailsToState(event, emit));
    add(LoadingDetailsEvent(index: index));
  }

  void _loadDetailsToState(LoadingDetailsEvent event, Emitter<PokemonDetailsState> emit) async {
    try {
      PokemonDetails pokemonDetails = await pokemonService.loadPokemonDetails(index: event.index);
      emit(PokemonDetailsState(description: pokemonDetails.description, type: pokemonDetails.type));
    } on PokemonException catch(error) {
      emit(ErrorDetailsState(errorMessage: error.message));
    }
  }

}