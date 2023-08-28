import 'package:flutter/material.dart';
import 'package:flutter_auth/core/extension/context_extension.dart';

@immutable
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.label,
    this.controller,
    this.validator,
    this.icon,
  });
  final String? label;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      cursorColor: context.colors.onSecondary,
      decoration: InputDecoration(
        focusColor: context.colors.onSecondary,
        labelText: label,
        icon: Icon(
          icon,
          size: 30,
          color: context.colors.onSecondary,
        ),
      ),
    );
  }
}
