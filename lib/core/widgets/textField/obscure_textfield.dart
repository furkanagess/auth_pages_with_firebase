import 'package:flutter/material.dart';
import 'package:flutter_auth/core/extension/context_extension.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

@immutable
class ObscureTextField extends StatelessWidget {
  const ObscureTextField({
    super.key,
    this.label,
    this.icon,
    this.lockControl,
    this.controller,
    this.validator,
    this.onTap,
  });
  final String? label;
  final IconData? icon;
  final bool? lockControl;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      cursorColor: context.colors.onSecondary,
      obscureText: lockControl!,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: onTap,
          child: Observer(
            builder: (_) {
              return Icon(
                lockControl! ? Icons.visibility_off : Icons.visibility,
                color: context.iconTheme.color,
              );
            },
          ),
        ),
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
