import 'package:flutter/material.dart';

import 'package:flutter_auth/core/extension/context_extension.dart';

@immutable
class OnBoardCircle extends StatelessWidget {
  final bool? isSelected;
  const OnBoardCircle({
    super.key,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: CircleAvatar(
        backgroundColor:
            context.colors.onSecondary.withOpacity(isSelected! ? 1 : 0.2),
        radius: isSelected! ? 8 : 5,
      ),
    );
  }
}
