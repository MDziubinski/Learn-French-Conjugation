import 'package:flutter/material.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';

class AnswerCard extends StatelessWidget {
  final String answer;

  final VoidCallback onTap;
  final bool multiChoice;
  final List<Color> colors;

  const AnswerCard({
    required this.answer,
    required this.onTap,
    required this.colors,
    Key? key,
    this.multiChoice = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>()!;

    return InkWell(
      borderRadius: BorderRadius.circular(AppDimens.sm),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimens.ml,
          horizontal: AppDimens.sm,
        ),
        decoration: BoxDecoration(
          borderRadius:
              multiChoice ? null : BorderRadius.circular(AppDimens.sm),
          color: colors[0],
          border: Border.all(
            color: theme.main,
          ),
        ),
        child: Text(
          answer,
          style: context.style11.copyWith(color: colors[1]),
        ),
      ),
    );
  }
}
