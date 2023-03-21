import 'package:flutter/material.dart';
import 'package:flutter_auth/core/extension/context_extension.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.title});
  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: context.paddingLow,
        shape: const StadiumBorder(),
        backgroundColor: context.colors.onSecondary,
      ),
      child: Center(
        child: Text(
          title,
          style: context.textTheme.titleLarge?.copyWith(
            color: context.colors.background,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
