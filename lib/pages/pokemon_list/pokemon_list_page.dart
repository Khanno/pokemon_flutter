import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter/helpers/enums.dart';
import 'package:pokemon_flutter/pages/pokemon_list/bloc/pokemon_list_bloc.dart';
import 'package:pokemon_flutter/pages/pokemon_list/bloc/pokemon_list_state.dart';
import 'package:pokemon_flutter/pages/pokemon_list/widgets/pokemon_list_card_widget.dart';
import 'package:pokemon_flutter/styles/custom_text_styles.dart';
import 'package:pokemon_flutter/widgets/bottom_navigator/custom_bottom_navigator.dart';

class PokemonListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFD94A4A),
          title: Text(
            'POKELISTA',
            style: customTitleStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.star_border_outlined)),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigator(
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
                  child: CircularProgressIndicator(),
                );
              default:
                return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.pokemonList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        PokemonListCardWidget(
                          pokemonName: state.pokemonList![index].pokemonName,
                          index: index + 1,
                          isFavorite: false,
                          image: Image.network(state.pokemonList![index].urlImage),
                          onTap: () {},
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 85.0),
                          child: Divider(color: Colors.grey, height: 5.0,),
                        )
                      ],
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
