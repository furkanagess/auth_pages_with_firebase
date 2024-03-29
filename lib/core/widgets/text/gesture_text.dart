import 'package:flutter/material.dart';
import 'package:flutter_auth/core/extension/context_extension.dart';

@immutable
class GestureText extends StatelessWidget {
  const GestureText({
    super.key,
    this.title,
    this.onTap,
  });
  final String? title;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title!,
        style: context.textTheme.bodyMedium?.copyWith(
          color: context.colors.onSecondary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
