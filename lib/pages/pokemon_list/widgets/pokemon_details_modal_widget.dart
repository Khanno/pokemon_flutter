import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter/model/pokemon_list_item.dart';
import 'package:pokemon_flutter/pages/pokemon_list/bloc/pokemon_details_bloc/pokemon_details_bloc.dart';
import 'package:pokemon_flutter/pages/pokemon_list/bloc/pokemon_details_bloc/pokemon_details_state.dart';
import 'package:pokemon_flutter/pages/pokemon_list/bloc/pokemon_list_bloc/pokemon_list_bloc.dart';
import 'package:pokemon_flutter/pages/pokemon_list/bloc/pokemon_list_bloc/pokemon_list_event.dart';
import 'package:pokemon_flutter/pages/pokemon_list/bloc/pokemon_list_bloc/pokemon_list_state.dart';
import 'package:pokemon_flutter/services/pokemon_service.dart';
import 'package:pokemon_flutter/styles/custom_text_styles.dart';
import 'package:pokemon_flutter/widgets/pokeball_loader/pokeball_loader_widget.dart';
import 'package:pokemon_flutter/helpers/string_helper.dart';

class PokemonDetailsModalWidget extends StatelessWidget {
  final PokemonListItemDetailed pokemon;
  final int index;

  PokemonDetailsModalWidget({
    required this.pokemon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PokemonDetailsBloc(
          pokemonService: PokemonService(),
          index: index,
          pokemonListItemDetailed: pokemon),
      child: BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
          builder: (BuildContext context, PokemonDetailsState state) {
        switch (state.runtimeType) {
          case LoadingDetailsState:
            return const Center(
              child: PokeballLoaderWidget(),
            );
          default:
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              pokemon.isCustom
                                  ? Image.memory(pokemon.customImage as Uint8List, width: 126.0, height: 135.0,)
                                  : Image.network(pokemon.urlImage, fit: BoxFit.cover),
                              const SizedBox(width: 15.0),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '#$index ${pokemon.pokemonName.toCapitalized()}',
                                    style: customDashboardText(
                                        color: Colors.white),
                                  ),
                                  Text(
                                    '${pokemon.customSpecie?.toCapitalized() ?? state.specie?.toCapitalized()}',
                                    style: customCardTitle(color: Colors.white),
                                  ),
                                  Text(
                                    pokemon.pokemonSkills.toCapitalized(),
                                    style: customCardTitle(color: Colors.white),
                                  ),
                                  Text(
                                    pokemon.pokemonType.toCapitalized(),
                                    style: customCardTitle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          BlocBuilder<PokemonListBloc, PokemonListState>(
                            builder:
                                (BuildContext context, PokemonListState state) {
                                  return IconButton(
                                      onPressed: () => context.read<PokemonListBloc>().add(SetFavoriteEvent(index: index)),
                                      icon: pokemon.isFavorite
                                          ? const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      )
                                          : const Icon(Icons.star_border_outlined));
                              },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        '${pokemon.customDescription ?? state.description}',
                        style: customCardTitle(color: Colors.white),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF048ABF),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'Gotta Catch \'Em All!',
                            style: customButtonText(color: Colors.white),
                          )),
                    ),
                  ],
                ));
        }
      }),
    );
  }
}
