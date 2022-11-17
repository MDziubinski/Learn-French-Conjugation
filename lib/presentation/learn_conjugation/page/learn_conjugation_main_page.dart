import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:french_conjugation_learn/generated/local_keys.g.dart';

import 'package:french_conjugation_learn/presentation/routing/main_router.gr.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';
import 'package:french_conjugation_learn/presentation/widget/common/option_tile.dart';

class LearnConjugationMainPage extends StatelessWidget {
  const LearnConjugationMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.mainPage_learnConjugation.tr(),
          style: theme?.style2.copyWith(color: theme.main),
        ),
        backgroundColor: theme?.tabBar,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppDimens.m,
            left: AppDimens.m,
            right: AppDimens.m,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                OptionTile(
                  content: LocaleKeys.conjugationLearnPage_courses.tr(),
                  onTappedInfo: () => showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(
                        LocaleKeys.mainPage_learnConjugation.tr(),
                        style: context.style3,
                      ),
                      content: Text(
                        LocaleKeys.modulesInfo_searchPageInfo.tr(),
                        style: context.style12,
                      ),
                      actions: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            context.router.pop();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(AppDimens.m),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  LocaleKeys.common_continue.tr(),
                                  style: context.style11,
                                ),
                                const SizedBox(width: AppDimens.m),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTapped: () =>
                      context.router.push(const CourseSelectionPageRoute()),
                  available: true,
                ),
                OptionTile(
                  content: LocaleKeys.conjugationLearnPage_revision.tr(),
                  onTappedInfo: () => showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(
                        LocaleKeys.conjugationLearnPage_revision.tr(),
                        style: context.style3,
                      ),
                      content: Text(
                        LocaleKeys.modulesInfo_dailyTaskInfo.tr(),
                        style: context.style12,
                      ),
                      actions: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            context.router.pop();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(AppDimens.m),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  LocaleKeys.common_continue.tr(),
                                  style: context.style11,
                                ),
                                const SizedBox(width: AppDimens.m),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTapped: () =>
                      context.router.push(const VerbGroupSelectionPageRoute()),
                  available: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
