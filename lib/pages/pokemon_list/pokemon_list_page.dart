import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter/helpers/enums.dart';
import 'package:pokemon_flutter/pages/pokemon_list/bloc/pokemon_list_bloc/pokemon_list_bloc.dart';
import 'package:pokemon_flutter/pages/pokemon_list/bloc/pokemon_list_bloc/pokemon_list_state.dart';
import 'package:pokemon_flutter/pages/pokemon_list/widgets/pokemon_details_modal_widget.dart';
import 'package:pokemon_flutter/pages/pokemon_list/widgets/pokemon_list_card_widget.dart';
import 'package:pokemon_flutter/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:pokemon_flutter/widgets/bottom_navigator/custom_bottom_navigator_widget.dart';
import 'package:pokemon_flutter/widgets/pokeball_loader/pokeball_loader_widget.dart';

import 'bloc/pokemon_list_bloc/pokemon_list_event.dart';

class PokemonListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBarWidget(
          title: 'POKELISTA',
          actions: [
            BlocBuilder<PokemonListBloc, PokemonListState>(
              builder: (BuildContext context, PokemonListState state) {
                return  IconButton(
                    onPressed: () {
                      context.read<PokemonListBloc>().add(
                          ShowFavoritesEvent(
                              showFavorite: !state.showFavorites!));
                    },
                    icon: state.showFavorites! == true
                        ? const Icon(Icons.star, color: Colors.yellow,)
                        : const Icon(Icons.star_border_outlined));
              }
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigatorWidget(
          currentIndex: BottomNavigatorIndex.POKE_LIST,
        ),
        body: BlocConsumer<PokemonListBloc, PokemonListState>(
          listener: (BuildContext context, PokemonListState state) {
            if (state is ErrorState) {
              final SnackBar snackBar =
                  SnackBar(content: Text((state.errorMessage as String)));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (BuildContext context, PokemonListState state) {
            switch (state.runtimeType) {
              case LoadingState:
                return const Center(
                  child: PokeballLoaderWidget(),
                );
              default:
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.pokemonList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              state.showFavorites == true
                                  ? state.pokemonList![index].isFavorite == state.showFavorites ? PokemonListCardWidget(
                                  pokemonName: state.pokemonList![index].pokemonName,
                                  index: index + 1,
                                  isFavorite: state.pokemonList![index].isFavorite,
                                  image: state.pokemonList![index].isCustom
                                    ? Image.memory(
                                      state.pokemonList![index].customImage as Uint8List,
                                      fit: BoxFit.cover,
                                      width: 127.0,
                                      height: 127.0,
                                    )
                                    : Image.network(
                                      state.pokemonList![index].urlImage,
                                      fit: BoxFit.cover,
                                      width: 127.0,
                                      height: 127.0,
                                    ),
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        backgroundColor: const Color(0xFF5CC8F2),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15.0),
                                            topRight: Radius.circular(15.0))),
                                        builder: (BuildContext context) {
                                          return PokemonDetailsModalWidget(
                                            index: index + 1,
                                            pokemon: state.pokemonList![index],
                                          );
                                        },
                                      );
                                },
                              ) : Container()
                                  : PokemonListCardWidget(
                                pokemonName:
                                    state.pokemonList![index].pokemonName,
                                index: index + 1,
                                isFavorite: state.pokemonList![index].isFavorite,
                                image: state.pokemonList![index].isCustom
                                    ? Image.memory(
                                      state.pokemonList![index].customImage as Uint8List,
                                      fit: BoxFit.cover,
                                      width: 127.0,
                                      height: 127.0,
                                    )
                                    : Image.network(
                                      state.pokemonList![index].urlImage,
                                      fit: BoxFit.cover,
                                      width: 127.0,
                                      height: 127.0,
                                    ),
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      backgroundColor: const Color(0xFF5CC8F2),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15.0),
                                              topRight: Radius.circular(15.0))),
                                      builder: (BuildContext context) {
                                        return PokemonDetailsModalWidget(
                                          index: index + 1,
                                          pokemon: state.pokemonList![index],
                                        );
                                      });
                                },
                              ),
                              state.showFavorites == true ? Container() : const Padding(
                                padding: EdgeInsets.only(left: 85.0),
                                child: Divider(
                                  color: Colors.grey,
                                  height: 5.0,
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
