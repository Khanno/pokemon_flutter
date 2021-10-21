import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter/pages/new_pokemon/bloc/new_pokemon_event.dart';
import 'package:pokemon_flutter/pages/new_pokemon/bloc/new_pokemon_state.dart';
import 'package:pokemon_flutter/services/pokemon_exception.dart';
import 'package:pokemon_flutter/services/pokemon_response.dart';
import 'package:pokemon_flutter/services/pokemon_service.dart';

class NewPokemonBloc extends Bloc<NewPokemonEvent, NewPokemonState>{
  final PokemonService pokemonService;
  NewPokemonBloc({required this.pokemonService}) : super(LoadingDropdownButtons()) {
   on<LoadingContentEvent>((event, emit) => _loadingContentToState(event, emit));
   on<SetImageEvent>((event, emit) => _setImagePathToState(event, emit));
   on<SetPokemonNameEvent>((event, emit) => _setPokemonNameToState(event, emit));
   on<SetPokemonCategoryEvent>((event, emit) => _setPokemonCategoryToState(event, emit));
   on<SetPokemonTypeEvent>((event, emit) => _setPokemonTypeToState(event, emit));
   on<SetPokemonAbilityEvent>((event, emit) => _setPokemonAbilityToState(event, emit));
   on<SetPokemonDescriptionEvent>((event, emit) => _setPokemonDescriptionToState(event, emit));
   add(LoadingContentEvent());
  }

  void _loadingContentToState(LoadingContentEvent event, Emitter<NewPokemonState> emit) async {
    try {
      PokemonResponse typesResponse = await pokemonService.loadTypes();
      List<String> listOfTypes = [];
      typesResponse.content!['results'].forEach((type) => listOfTypes.add(type['name']));

      PokemonResponse abilitiesResponse = await pokemonService.loadAbilities();
      List<String> listOfAbilities = [];
      abilitiesResponse.content!['results'].forEach((ability) => listOfAbilities.add(ability['name']));

      PokemonResponse categoriesResponse = await pokemonService.loadCategories();
      List<String> listOfCategories = [];
      categoriesResponse.content!['results'].forEach((category) => listOfCategories.add(category['name']));

      emit(NewPokemonState(categories: listOfCategories, abilities: listOfAbilities, types: listOfTypes));
    } on PokemonException catch(e) {
      emit(ErrorState(message: e.message));
    }
  }

  void _setImagePathToState(SetImageEvent event, Emitter<NewPokemonState> emit) {
    emit(state.copyWith(imageBytes: event.imageBytes));
  }

  void _setPokemonNameToState(SetPokemonNameEvent event, Emitter<NewPokemonState> emit) {
    emit(state.copyWith(name: event.pokemonName));
  }

  void _setPokemonCategoryToState(SetPokemonCategoryEvent event, Emitter<NewPokemonState> emit) {
    emit(state.copyWith(category: event.pokemonCategory));
  }

  void _setPokemonTypeToState(SetPokemonTypeEvent event, Emitter<NewPokemonState> emit) {
    emit(state.copyWith(type: event.pokemonType));
  }

  void _setPokemonAbilityToState(SetPokemonAbilityEvent event, Emitter<NewPokemonState> emit) {
    emit(state.copyWith(ability: event.pokemonAbility));
  }

  void _setPokemonDescriptionToState(SetPokemonDescriptionEvent event, Emitter<NewPokemonState> emit) {
    emit(state.copyWith(description: event.pokemonDescription));
  }
}