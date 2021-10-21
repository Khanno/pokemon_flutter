import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class PokeballLoaderWidget extends StatefulWidget {
  const PokeballLoaderWidget({Key? key}) : super(key: key);

  @override
  _PokeballLoaderWidgetState createState() => _PokeballLoaderWidgetState();
}


class _PokeballLoaderWidgetState extends State<PokeballLoaderWidget> with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1), value: 0)..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(controller),
            alignment: Alignment.center,
            child: Container(
              height: 50.0,
              width: 50.0,
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/images/pokeball.svg'),
            ),
          );
        },
    );
  }
}
