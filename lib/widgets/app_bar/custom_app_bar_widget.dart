import 'package:flutter/material.dart';
import 'package:pokemon_flutter/styles/custom_text_styles.dart';

class CustomAppBarWidget extends StatelessWidget with PreferredSizeWidget{
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  CustomAppBarWidget({required this.title, this.actions, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFD94A4A),
      title: Text(
        title,
        style: customTitleStyle(color: Colors.white),
      ),
      centerTitle: true,
      actions: actions,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
