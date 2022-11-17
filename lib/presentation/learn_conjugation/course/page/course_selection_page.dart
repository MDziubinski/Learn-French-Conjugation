import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:french_conjugation_learn/generated/local_keys.g.dart';
import 'package:french_conjugation_learn/presentation/routing/main_router.gr.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';
import 'package:french_conjugation_learn/presentation/widget/common/option_tile.dart';

class CourseSelectionPage extends StatelessWidget {
  const CourseSelectionPage({Key? key}) : super(key: key);

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
                  content: LocaleKeys.coursePage_introduction.tr(),
                  onTapped: () {
                    context.router.push(const CourseIntroductionPageRoute());
                  },
                  available: true,
                  height: AppDimens.xxc,
                ),
                OptionTile(
                  content: LocaleKeys.coursePage_firstGroupVerbs.tr(),
                  onTapped: () {
                    context.router.push(const FirstGroupMainPageRoute());
                  },
                  available: true,
                  height: AppDimens.xxc,
                ),
                OptionTile(
                  content: LocaleKeys.coursePage_secondGroupVerbs.tr(),
                  onTapped: () {},
                  available: false,
                  height: AppDimens.xxc,
                ),
                OptionTile(
                  content: LocaleKeys.coursePage_thirdGroupVerbs.tr(),
                  onTapped: () {},
                  available: false,
                  height: AppDimens.xxc,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
