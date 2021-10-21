import 'package:flutter/material.dart';
import 'package:pokemon_flutter/styles/custom_text_styles.dart';

class CustomTextInputWidget extends StatelessWidget {
  final Widget? label;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final bool isRequired;

  CustomTextInputWidget({
    this.label,
    required this.controller,
    this.onChanged,
    required this.isRequired,
  });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: label,
        labelStyle: customCardTitle(),
      ),
      onChanged: onChanged,
      textAlign: TextAlign.left,
      keyboardType: TextInputType.text,
      validator: (value) {
        if(isRequired) {
          if(value == null || value.isEmpty) {
            return 'Este campo é obrigatório';
          }
        }
      },
    );
  }
}
