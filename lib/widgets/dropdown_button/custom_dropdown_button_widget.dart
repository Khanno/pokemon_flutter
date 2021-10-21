import 'package:flutter/material.dart';
import 'package:pokemon_flutter/styles/custom_text_styles.dart';

class CustomDropdownButtonWidget extends StatelessWidget {
  final String? hint;
  final Widget? label;
  final List<DropdownMenuItem> items;
  final Function(dynamic) onChanged;
  final Function(dynamic) validator;
  final bool isRequired;
  final String? value;

  CustomDropdownButtonWidget({
    this.hint,
    this.label,
    required this.items,
    required this.onChanged,
    required this.validator,
    required this.isRequired,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      validator: validator as String? Function(dynamic),
      decoration: InputDecoration(
        label: label,
        labelStyle: customCardTitle(),
        hintText: hint,
        hintStyle: customCardTitle(),
        errorStyle: customCardTitle(color: Colors.red)
      ),
      items: items,
      value: value,
      onChanged: onChanged,
      style: customCardTitle(),
    );
  }
}
