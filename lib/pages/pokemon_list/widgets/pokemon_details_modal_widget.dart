import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter/pages/pokemon_list/bloc/pokemon_details_bloc/pokemon_details_bloc.dart';
import 'package:pokemon_flutter/pages/pokemon_list/bloc/pokemon_details_bloc/pokemon_details_state.dart';
import 'package:pokemon_flutter/services/pokemon_service.dart';
import 'package:pokemon_flutter/styles/custom_text_styles.dart';

class PokemonDetailsModalWidget extends StatelessWidget {
  final Widget image;
  final int index;
  final String name;
  final String abilities;
  final String type;
  final bool isFavorite;
  final Function() onPressed;

  PokemonDetailsModalWidget({
    required this.index,
    required this.image,
    required this.name,
    required this.type,
    required this.abilities,
    required this.isFavorite,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          PokemonDetailsBloc(pokemonService: PokemonService(), index: index),
      child: BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
          builder: (BuildContext context, PokemonDetailsState state) {
        switch (state.runtimeType) {
          case LoadingDetailsState:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
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
                            image,
                            const SizedBox(width: 15.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '#$index $name',
                                  style: customDashboardText(color: Colors.white),
                                ),
                                Text(
                                  '${state.type}',
                                  style: customCardTitle(color: Colors.white),
                                ),
                                Text(
                                  abilities,
                                  style: customCardTitle(color: Colors.white),
                                ),
                                Text(
                                  type,
                                  style: customCardTitle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: onPressed,
                            icon: isFavorite
                                ? const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            )
                                : const Icon(Icons.star_border_outlined)),
                      ],
                    ),
                  ),
                  Text(
                    '${state.description}',
                    style: customCardTitle(color: Colors.white),
                    textAlign: TextAlign.justify,
                    softWrap: true,
                    textWidthBasis: TextWidthBasis.parent,
                  ),
                  const SizedBox(height: 15.0,),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF048ABF),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Gotta Catch \'Em All!', style: customButtonText(color: Colors.white),)),
                  ),
                ],
              )
            );
        }
      }),
    );
  }
}
