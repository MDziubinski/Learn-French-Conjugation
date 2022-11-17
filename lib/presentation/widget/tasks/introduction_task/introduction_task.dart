import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:french_conjugation_learn/generated/local_keys.g.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';
import 'package:french_conjugation_learn/presentation/widget/common/answer_card.dart';
import 'package:french_conjugation_learn/presentation/widget/common/custom_animated_button.dart';

const String _introText =
    'Test consist of couple simple questions. There are different types of tasks possible, single choice, true false and multichoice. Type of the task is mentioned in the description. Good Luck!';

class IntroductionTask extends StatelessWidget {
  const IntroductionTask({
    required this.nextTask,
    Key? key,
  }) : super(key: key);

  final Function(bool) nextTask;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>()!;

    return Padding(
      padding: const EdgeInsets.all(AppDimens.m),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _introText,
            style: theme.style4,
          ),
          const SizedBox(height: AppDimens.c),
          CustomAnimatedButton(
            inactiveColors: [theme.white, theme.main],
            activeColors: [theme.primary100, theme.main],
            builder: (colors) => AnswerCard(
              onTap: () {},
              answer: LocaleKeys.test_start.tr(),
              colors: colors,
            ),
            isActive: true,
          ),
        ],
      ),
    );
  }
}
