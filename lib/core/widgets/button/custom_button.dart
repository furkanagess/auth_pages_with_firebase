import 'package:flutter/material.dart';
import 'package:flutter_auth/core/extension/context_extension.dart';

@immutable
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.title,
    this.color,
  });
  final VoidCallback? onPressed;
  final String? title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: context.paddingLow,
        shape: const StadiumBorder(),
        backgroundColor: color,
      ),
      child: Center(
        child: Text(
          title!,
          style: context.textTheme.titleLarge?.copyWith(
            color: context.colors.background,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
