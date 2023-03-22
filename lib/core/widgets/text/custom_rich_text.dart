import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/core/extension/context_extension.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({super.key, required this.firstSpan, required this.secondSpan, required this.onTap});
  final String firstSpan;
  final String secondSpan;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstSpan,
        style: context.textTheme.bodyMedium,
        children: [
          TextSpan(
            // fixme
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: secondSpan,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
