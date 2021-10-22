import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter/model/pokemon_list_item.dart';
import 'package:pokemon_flutter/pages/pokemon_list/bloc/pokemon_list_bloc/pokemon_list_event.dart';
import 'package:pokemon_flutter/pages/pokemon_list/bloc/pokemon_list_bloc/pokemon_list_state.dart';
import 'package:pokemon_flutter/services/pokemon_exception.dart';
import 'package:pokemon_flutter/services/pokemon_service.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final PokemonService pokemonService;
  PokemonListBloc({required this.pokemonService}) : super(LoadingState()) {
    on<LoadFullList>((event, emit) => _mapPokemonListToState(event, emit));
    on<SetFavoriteEvent>((event, emit) => _invertPokemonFavoriteState(event, emit));
    on<CreateNewPokemonEvent>((event, emit) => _createNewPokemonState(event, emit));
    on<ShowFavoritesEvent>((event, emit) => _showFavoritesState(event, emit));
    add(LoadFullList());
  }

  void _mapPokemonListToState(LoadFullList event, Emitter<PokemonListState> emit) async {
    emit(LoadingState(pokemonList: state.pokemonList ?? []));
    try {
      List<PokemonListItemDetailed> detailedList = state.pokemonList ?? [];
      for(int i = 0; i < 15; i++) {
        PokemonListItemDetailed pokemonInfo = await pokemonService.loadPokemonList(pokemonId: i + 1);
        detailedList.add(pokemonInfo);
      }
      emit(PokemonListState(pokemonList: detailedList, showFavorites: false));
    } on PokemonException catch (e) {
      emit(ErrorState(message: e.message));
    }
  }

  void _invertPokemonFavoriteState(SetFavoriteEvent event, Emitter<PokemonListState> emit) async {
    List<PokemonListItemDetailed> newList = state.pokemonList ?? [];
    newList[event.index - 1].isFavorite = !newList[event.index - 1].isFavorite;
    emit(state.copyWith(pokemonList: newList));
  }

  void _createNewPokemonState(CreateNewPokemonEvent event, Emitter<PokemonListState> emit) {
    emit(SavingNewPokemon(pokemonList: state.pokemonList));
    List<PokemonListItemDetailed> newList = state.pokemonList ?? [];
    newList.add(event.newPokemon);
    emit(PokemonCreated(pokemonList: newList));
  }

  void _showFavoritesState(ShowFavoritesEvent event, Emitter<PokemonListState> emit) {
    emit(state.copyWith(showFavorites: !(state.showFavorites as bool)));
  }
}