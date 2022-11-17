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

class FirstGroupInflectionalEndingsPage extends HookWidget {
  final FirstGroupCourse firstGroupCourse;
  final FirstGroupCourseContentCubit cubit;

  const FirstGroupInflectionalEndingsPage({
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
          LocaleKeys.coursePage_inflectionalEndings.tr(),
          style: theme.style2.copyWith(color: theme.main),
        ),
        backgroundColor: theme.tabBar,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: theme.primary100,
        onPressed: () {
          cubit.updateProgres('firstGroupInflectionalEndings');
          context.router.replace(FirstGroupFollowVerbPageRoute(
            firstGroupCourse: firstGroupCourse,
            mainCubit: cubit,
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
        padding: const EdgeInsets.only(
          top: AppDimens.m,
          left: AppDimens.m,
          right: AppDimens.m,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                firstGroupCourse.inflectionalEndings.description.first,
                style: theme.style9,
              ),
              const SizedBox(height: AppDimens.l),
              ..._generateConjugationTilesWidgets(
                      firstGroupCourse.inflectionalEndings.mapEndings)
                  .toList(),
              const SizedBox(height: AppDimens.xxxxc),
            ],
          ),
        ),
      ),
    );
  }
}

Iterable<Padding> _generateConjugationTilesWidgets(
    Map<String, Map<String, List<String>>> mappedEndings) sync* {
  for (final mappedEnd in mappedEndings.entries) {
    yield Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.l),
      child: EndingTile(mappedEndings: mappedEnd),
    );
  }
}

class EndingTile extends StatelessWidget {
  const EndingTile({
    required this.mappedEndings,
    Key? key,
  }) : super(key: key);

  final MapEntry<String, Map<String, List<String>>> mappedEndings;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppDimens.m),
          child: Text(
            mappedEndings.key,
            style: theme.style6,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: mappedEndings.value.entries.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, indexMain) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  mappedEndings.value.keys.elementAt(indexMain),
                  style: theme.style15,
                ),
                Row(
                  children: _generateEndingTilesWidgets(
                    mappedEndings.value.values.elementAt(indexMain),
                    theme,
                  ).toList(),
                )
              ],
            );
          },
        )
      ],
    );
  }

  Iterable<Text> _generateEndingTilesWidgets(
      List<String> mappedEndings, CustomAppTheme theme) sync* {
    for (final mappedEnd in mappedEndings) {
      yield Text(
        '$mappedEnd,',
        style: theme.style13,
      );
    }
  }
}
