import 'package:flutter/material.dart';
import 'package:pokemon_flutter/styles/custom_text_styles.dart';

class CustomTextInputWidget extends StatelessWidget {
  final Widget? label;
  final String? hint;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final bool isRequired;
  final TextInputAction textInputAction;

  CustomTextInputWidget({
    this.label,
    this.hint,
    required this.controller,
    this.onChanged,
    required this.isRequired,
    required this.textInputAction,
  });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: label,
        hintText: hint,
        hintStyle: customCardTitle(),
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: customCardTitle(),
        errorStyle: customCardTitle(color: Colors.red),
      ),
      textCapitalization: TextCapitalization.sentences,
      onChanged: onChanged,
      textAlign: TextAlign.left,
      textInputAction: textInputAction,
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
