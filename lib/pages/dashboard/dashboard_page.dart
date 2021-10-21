import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokemon_flutter/helpers/enums.dart';
import 'package:pokemon_flutter/pages/dashboard/widgets/menu_cards.dart';
import 'package:pokemon_flutter/styles/custom_text_styles.dart';
import 'package:pokemon_flutter/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:pokemon_flutter/widgets/bottom_navigator/custom_bottom_navigator_widget.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBarWidget(title: 'POKEDEX',),
          bottomNavigationBar: CustomBottomNavigatorWidget(currentIndex: BottomNavigatorIndex.HOME,),
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/pokemon_background.png'),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    children: [
                      SvgPicture.asset('assets/images/pokemon_title.svg'),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: MenuCardsWidget(
                                title: 'Veja todos os 150 Pokémons',
                                linkTitle: 'Visualizar Pokémons ',
                                onTap: () => Navigator.pushNamed(context, '/pokemon-list'),
                              ),
                            ),
                            SizedBox(width: 43.0),
                            Expanded(
                              child: MenuCardsWidget(
                                title: 'Crie já seu próprio Pokémon',
                                linkTitle: 'Cadastrar novo Pokémon',
                                onTap: () => Navigator.pushNamed(context, '/new-pokemon'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: (70 * 100) / MediaQuery.of(context).size.height,
                  ),
                  Column(
                    children: [
                      Text(
                        'As circunstâncias do nascimento de alguém são irrelevantes; é o que você faz com o dom da vida que determina quem você é.',
                        style: customDashboardText(),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: GestureDetector(
                          onDoubleTap: () {
                            showDialog(context: context, builder: (BuildContext context) {
                              return CupertinoAlertDialog(
                                content: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Center(
                                    child: Text(
                                      'Aplicativo feito para realização do teste para a vaga de Flutter na Tunts - Nakatani',
                                      style: customTitleStyle(color: Colors.deepOrange, isBold: true),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              );
                            });
                          },
                          child: Text(
                            'Mewtwo',
                            style: customDashboardText(),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
