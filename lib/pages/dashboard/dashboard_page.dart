import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokemon_flutter/pages/dashboard/widgets/menu_cards.dart';
import 'package:pokemon_flutter/styles/custom_text_styles.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFFD94A4A),
            title: Text(
              'POKEDEX',
              style: customTitleStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color(0xFFD94A4A),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Pokelista',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outlined),
                label: 'Cadastro',
                backgroundColor: Colors.white,
              ),
            ],
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            onTap: (int _) {},
          ),
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
                                onTap: () {},
                              ),
                            ),
                            SizedBox(width: 43.0),
                            Expanded(
                              child: MenuCardsWidget(
                                title: 'Crie já seu próprio Pokémon',
                                linkTitle: 'Cadastrar novo Pokémon',
                                onTap: () {},
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
                        style: dashboardText(),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Mewtwo',
                          style: dashboardText(),
                          textAlign: TextAlign.right,
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
