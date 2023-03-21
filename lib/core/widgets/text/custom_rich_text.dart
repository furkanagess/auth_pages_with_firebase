import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/core/extension/context_extension.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({super.key, this.recognizer, required this.firstSpan, required this.secondSpan});
  final String firstSpan;
  final String secondSpan;
  final GestureRecognizer? recognizer;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstSpan,
        style: context.textTheme.bodyMedium,
        children: [
          TextSpan(
            // fixme
            recognizer: recognizer,
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
