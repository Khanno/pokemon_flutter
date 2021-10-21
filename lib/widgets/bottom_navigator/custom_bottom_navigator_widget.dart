import 'package:flutter/material.dart';
import 'package:pokemon_flutter/helpers/enums.dart';

class CustomBottomNavigatorWidget extends StatelessWidget {
  final BottomNavigatorIndex currentIndex;

  CustomBottomNavigatorWidget({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      currentIndex: _convertEnumToInt(index: currentIndex),
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      onTap: (int index) {
        if(index == _convertEnumToInt(index: currentIndex)) {
          return;
        } else {
          switch(index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/pokemon-list');
              break;
            case 2:
              Navigator.pushNamed(context, '/new-pokemon');
              break;
          }
        }
      },
    );
  }
}

int _convertEnumToInt({required BottomNavigatorIndex index}) {
  switch(index) {
    case BottomNavigatorIndex.HOME:
      return 0;
    case BottomNavigatorIndex.POKE_LIST:
      return 1;
    case BottomNavigatorIndex.ADD_NEW_POKEMON:
      return 2;
  }
}
