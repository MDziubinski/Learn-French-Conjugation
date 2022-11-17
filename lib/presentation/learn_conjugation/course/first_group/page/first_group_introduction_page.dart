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
import 'package:french_conjugation_learn/presentation/widget/common/custom_page_indicator.dart';

class FirstGroupIntroductionPage extends HookWidget {
  final FirstGroupCourse firstGroupCourse;
  final FirstGroupCourseContentCubit cubit;

  const FirstGroupIntroductionPage({
    required this.firstGroupCourse,
    required this.cubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>()!;
    final pageController = usePageController();
    final floatingVisibility = useState(false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.coursePage_introduction.tr(),
          style: theme.style2.copyWith(color: theme.main),
        ),
        backgroundColor: theme.tabBar,
      ),
      floatingActionButton: Visibility(
        visible: floatingVisibility.value,
        child: FloatingActionButton.extended(
          backgroundColor: theme.primary100,
          onPressed: () {
            cubit.updateProgres('firstGroupIntro');
            context.router.replace(FirstGroupMainRulesPageRoute(
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
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: firstGroupCourse.introduction.description.length,
              onPageChanged: (index) {
                if (index ==
                    firstGroupCourse.introduction.description.length - 1) {
                  floatingVisibility.value = true;
                } else {
                  floatingVisibility.value = false;
                }
              },
              itemBuilder: (context, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimens.m),
                    child: Text(
                      firstGroupCourse.introduction.description[index],
                      textAlign: TextAlign.center,
                      style: context.style5,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.l),
            child: SizedBox(
              height: AppDimens.l,
              width: AppDimens.c,
              child: CustomPageIndicator(
                controller: pageController,
                count: firstGroupCourse.introduction.description.length,
                activeColor: theme.primary100,
                inactiveColor: theme.grey30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
