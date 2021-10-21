import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon_flutter/helpers/enums.dart';
import 'package:pokemon_flutter/model/pokemon_list_item.dart';
import 'package:pokemon_flutter/pages/new_pokemon/bloc/new_pokemon_bloc.dart';
import 'package:pokemon_flutter/pages/new_pokemon/bloc/new_pokemon_event.dart';
import 'package:pokemon_flutter/pages/new_pokemon/bloc/new_pokemon_state.dart';
import 'package:pokemon_flutter/pages/pokemon_list/bloc/pokemon_list_bloc/pokemon_list_bloc.dart';
import 'package:pokemon_flutter/pages/pokemon_list/bloc/pokemon_list_bloc/pokemon_list_event.dart';
import 'package:pokemon_flutter/pages/pokemon_list/bloc/pokemon_list_bloc/pokemon_list_state.dart';
import 'package:pokemon_flutter/styles/custom_text_styles.dart';
import 'package:pokemon_flutter/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:pokemon_flutter/widgets/bottom_navigator/custom_bottom_navigator_widget.dart';
import 'package:pokemon_flutter/widgets/dropdown_button/custom_dropdown_button_widget.dart';
import 'package:pokemon_flutter/widgets/text_input/custom_text_input_widget.dart';
import 'package:image_picker/image_picker.dart';

class NewPokemonPage extends StatelessWidget {
  final GlobalKey<FormState> newPokemonFormKey = GlobalKey<FormState>();
  final TextEditingController pokemonName = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBarWidget(
            title: 'CADASTRE SEU POKÉMON',
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          bottomNavigationBar: CustomBottomNavigatorWidget(currentIndex: BottomNavigatorIndex.ADD_NEW_POKEMON,),
          body: Material(
            child: BlocBuilder<NewPokemonBloc, NewPokemonState>(
              builder: (BuildContext context, NewPokemonState state) {
                switch(state.runtimeType) {
                  case LoadingDropdownButtons:
                    return const Center(child: CircularProgressIndicator());
                  default:
                    return Form(
                      key: newPokemonFormKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Crie seu próprio Pokémon'),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                                      if(image != null) {
                                        Uint8List imageBytes = await image.readAsBytes();
                                        context.read<NewPokemonBloc>().add(SetImageEvent(imageBytes: imageBytes));
                                      }
                                    },
                                    child: Column(
                                      children: [
                                        state.imageBytes == null ? SvgPicture.asset('assets/images/pokeball.svg') : Image.memory(state.imageBytes as Uint8List, width: 127.0, height: 127.0,),
                                        const Text('Editar'),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 15.0,),
                                  Expanded(
                                    child: CustomTextInputWidget(
                                      label: const Text('Nome do Pokémon'),
                                      controller: pokemonName,
                                      isRequired: true,
                                      onChanged: (String value) => context.read<NewPokemonBloc>().add(SetPokemonNameEvent(pokemonName: pokemonName.text)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CustomDropdownButtonWidget(
                                      isRequired: true,
                                      validator: (value) {
                                        if(value == 'Categoria' || value == null || value == '') {
                                          return 'Este campo é obrigatório';
                                        }
                                        return null;
                                      },
                                      label: const Text('Categoria'),
                                      items: state.categories!.map(
                                              (category) => DropdownMenuItem(
                                                child: Text(category.replaceAll('-', ' ')),
                                                value: category.replaceAll('-', ' '),
                                              ),
                                      ).toList(),
                                      onChanged: (value) => context.read<NewPokemonBloc>().add(SetPokemonCategoryEvent(pokemonCategory: value)),
                                      value: null,
                                    ),
                                  ),
                                  const SizedBox(width: 33.0,),
                                  Expanded(
                                    child: CustomDropdownButtonWidget(
                                      isRequired: true,
                                      validator: (value) {
                                        if(value == 'Tipo' || value == null || value == '') {
                                          return 'Este campo é obrigatório';
                                        }
                                        return null;
                                      },
                                      label: Text('Tipo'),
                                      items: state.types!.map(
                                              (type) => DropdownMenuItem(
                                                child: Text(type.replaceAll('-', ' ')),
                                                value: type.replaceAll('-', ' '),
                                              ),
                                      ).toList(),
                                      onChanged: (value) => context.read<NewPokemonBloc>().add(SetPokemonTypeEvent(pokemonType: value)),
                                      value: null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomDropdownButtonWidget(
                                      isRequired: true,
                                      validator: (value) {
                                        if(value == 'Habilidades' || value == null || value == '') {
                                          return 'Este campo é obrigatório';
                                        }
                                        return null;
                                      },
                                      label: Text('Habilidades'),
                                      items: state.abilities!.map(
                                              (ability) => DropdownMenuItem(
                                                child: Text(ability.replaceAll('-', ' ')),
                                                value: ability.replaceAll('-', ' '),
                                              ),
                                      ).toList(),
                                      onChanged: (value) => context.read<NewPokemonBloc>().add(SetPokemonAbilityEvent(pokemonAbility: value)),
                                      value: null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: CustomTextInputWidget(
                                  controller: descriptionController,
                                  onChanged: (String value) => context.read<NewPokemonBloc>().add(SetPokemonDescriptionEvent(pokemonDescription: descriptionController.text)),
                                  label: Text('Descrição'),
                                  isRequired: true,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF048ABF),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 88.0),
                                child: BlocConsumer<PokemonListBloc, PokemonListState>(
                                  listener: (BuildContext context, PokemonListState state) {
                                    if(state is PokemonCreated) {
                                      SnackBar snackBar = const SnackBar(content: Text('Pokemon criado com sucesso!'));
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                      Navigator.pop(context);
                                    }
                                  },
                                  builder: (BuildContext context, PokemonListState listState) {
                                    return TextButton(
                                        onPressed: () {
                                          if(newPokemonFormKey.currentState!.validate()) {
                                            context.read<PokemonListBloc>().add(
                                              CreateNewPokemonEvent(
                                                newPokemon: PokemonListItemDetailed(
                                                  isCustom: true,
                                                  isFavorite: false,
                                                  urlImage: '',
                                                  pokemonName: state.name ?? '',
                                                  pokemonSkills: state.ability ?? '',
                                                  pokemonType: state.type ?? '',
                                                  customSpecie: state.category ?? '',
                                                  customDescription: state.description ?? '',
                                                  customImage: state.imageBytes,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        child: Text(
                                          'Salvar',
                                          style: customButtonText(color: Colors.white),
                                        ),
                                    );
                                  }
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                }
              }
            ),
          ),
        ));
  }
}
