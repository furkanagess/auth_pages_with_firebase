import 'package:flutter/material.dart';
import 'package:flutter_auth/core/extension/context_extension.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.onPressed, required this.title, required this.icon, this.color});
  final VoidCallback onPressed;
  final String title;
  final IconData icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        icon,
        color: context.colors.background,
      ),
      onPressed: onPressed,
      label: Center(
        child: Text(
          title,
          style: context.textTheme.titleLarge?.copyWith(
            color: context.colors.background,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: context.paddingLow,
        shape: const StadiumBorder(),
        backgroundColor: color,
      ),
    );
  }
}
