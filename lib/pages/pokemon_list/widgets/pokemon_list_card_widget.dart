import 'package:flutter/material.dart';
import 'package:pokemon_flutter/styles/custom_text_styles.dart';
import 'package:pokemon_flutter/helpers/string_helper.dart';

class PokemonListCardWidget extends StatelessWidget {
  final Widget? image;
  final String pokemonName;
  final bool isFavorite;
  final int index;
  final Function() onTap;

  PokemonListCardWidget({
    this.image,
    required this.index,
    required this.pokemonName,
    required this.isFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15.0),
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
                ),
                SizedBox(width: 20.0,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(pokemonName.toCapitalized(), style: customListCardTitle(),),
                    Text('#$index', style: customListCardTitle(color: Colors.grey),),
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
