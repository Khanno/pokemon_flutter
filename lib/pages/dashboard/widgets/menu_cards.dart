import 'package:flutter/material.dart';
import 'package:pokemon_flutter/styles/custom_text_styles.dart';

class MenuCardsWidget extends StatelessWidget {
  final String title;
  final String linkTitle;
  final Function() onTap;

  MenuCardsWidget({required this.title, required this.linkTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color(0xFFF2BE22),
        elevation: 3.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 11.0, horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: customCardTitle(),),
              SizedBox(height: 12.0,),
              Text(linkTitle, style: customCardLinkStyle(),),
            ],
          ),
        ),
      ),
    );
  }
}
