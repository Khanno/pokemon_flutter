import 'package:flutter/material.dart';
import 'package:pokemon_flutter/styles/custom_text_styles.dart';
import 'package:pokemon_flutter/helpers/string_helper.dart';

class PokemonListCardWidget extends StatelessWidget {
  final Widget image;
  final String pokemonName;
  final bool isFavorite;
  final int index;
  final Function() onTap;

  PokemonListCardWidget({
    required this.image,
    required this.index,
    required this.pokemonName,
    required this.isFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF1AA7D3),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: image,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          pokemonName.toCapitalized(),
                          style: customListCardTitle(),
                        ),
                        isFavorite
                            ? const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              )
                            : const Icon(Icons.star_border_outlined),
                      ],
                    ),
                    Text(
                      '#$index',
                      style: customListCardTitle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
