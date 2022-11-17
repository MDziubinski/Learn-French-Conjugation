import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:french_conjugation_learn/domain/course/model/first_group_models/first_group_course_content.dart';
import 'package:french_conjugation_learn/generated/local_keys.g.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/first_group/cubit/first_group_introduction_cubit.dart';
import 'package:french_conjugation_learn/presentation/routing/main_router.gr.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';

class FirstGroupMainRulesPage extends HookWidget {
  final FirstGroupCourse firstGroupCourse;
  final FirstGroupCourseContentCubit cubit;

  const FirstGroupMainRulesPage({
    required this.firstGroupCourse,
    required this.cubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>()!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.coursePage_mainRules.tr(),
          style: theme.style2.copyWith(color: theme.main),
        ),
        backgroundColor: theme.tabBar,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: theme.primary100,
        onPressed: () {
          cubit.updateProgres('firstGroupMainRules');
          context.router.replace(FirstGroupInflectionalEndingsPageRoute(
            firstGroupCourse: firstGroupCourse,
            cubit: cubit,
          ));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.m),
        ),
        label: Text(
          LocaleKeys.common_continue.tr(),
          style: theme.style11,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.m),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => Text(
                  firstGroupCourse.mainRules.description[index],
                  style: theme.style9,
                ),
                separatorBuilder: (_, __) =>
                    const SizedBox(height: AppDimens.s),
                itemCount: firstGroupCourse.mainRules.description.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
