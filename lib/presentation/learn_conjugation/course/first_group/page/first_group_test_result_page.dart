import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:french_conjugation_learn/domain/task/model/task_model.dart';
import 'package:french_conjugation_learn/generated/local_keys.g.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/first_group/cubit/first_group_introduction_cubit.dart';
import 'package:french_conjugation_learn/presentation/routing/main_router.gr.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';
import 'package:french_conjugation_learn/presentation/widget/common/answer_card.dart';
import 'package:french_conjugation_learn/presentation/widget/common/custom_animated_button.dart';
import 'package:french_conjugation_learn/presentation/widget/tasks/result_tile.dart';

class FirstGroupTestResultPage extends StatelessWidget {
  final FirstGroupCourseContentCubit cubit;

  const FirstGroupTestResultPage({
    required this.passedTasks,
    required this.tasks,
    required this.passedTest,
    required this.cubit,
    Key? key,
  }) : super(key: key);

  final List<bool> passedTasks;
  final List<TaskModel> tasks;
  final bool passedTest;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>()!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.firstGroup_firstGroupResults.tr(),
          style: theme.style2.copyWith(color: theme.main),
        ),
        backgroundColor: theme.tabBar,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: AppDimens.m,
          left: AppDimens.m,
          right: AppDimens.m,
        ),
        child: Column(
          children: [
            if (passedTest)
              Column(
                children: [
                  Text(
                    LocaleKeys.common_congratulations.tr(),
                    style: theme.style2,
                  ),
                  Text(
                    LocaleKeys.test_passed.tr(),
                    style: theme.style9,
                  ),
                ],
              )
            else
              Column(
                children: [
                  Text(
                    LocaleKeys.common_failed.tr(),
                    style: theme.style2,
                  ),
                  Text(
                    LocaleKeys.test_failed.tr(),
                    style: theme.style9,
                  ),
                ],
              ),
            Text(
              LocaleKeys.test_results.tr(),
              style: theme.style9,
            ),
            const SizedBox(height: AppDimens.l),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) => ResultTile(
                  passedTask: passedTasks[index],
                  currentTask: tasks[index],
                ),
              ),
            ),
            if (!passedTest)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomAnimatedButton(
                    inactiveColors: [theme.grey30, theme.main],
                    activeColors: [theme.primary100, theme.main],
                    builder: (colors) => AnswerCard(
                      onTap: () {
                        context.router
                            .popUntilRouteWithName('CourseSelectionPageRoute');
                      },
                      answer: LocaleKeys.coursePage_name.tr(),
                      colors: colors,
                    ),
                    isActive: true,
                  ),
                  CustomAnimatedButton(
                    inactiveColors: [theme.grey30, theme.main],
                    activeColors: [theme.primary100, theme.main],
                    builder: (colors) => AnswerCard(
                      onTap: () {
                        context.router.replace(FirstGroupTestPageRoute(
                          mainCubit: cubit,
                        ));
                      },
                      answer: LocaleKeys.test_retake.tr(),
                      colors: colors,
                    ),
                    isActive: true,
                  ),
                ],
              )
            else
              CustomAnimatedButton(
                inactiveColors: [theme.grey30, theme.main],
                activeColors: [theme.primary100, theme.main],
                builder: (colors) => AnswerCard(
                  onTap: () {
                    context.router
                        .popUntilRouteWithName('CourseSelectionPageRoute');
                  },
                  answer: LocaleKeys.firstGroup_backToCourse.tr(),
                  colors: colors,
                ),
                isActive: true,
              ),
            const SizedBox(height: AppDimens.l)
          ],
        ),
      ),
    );
  }
}
