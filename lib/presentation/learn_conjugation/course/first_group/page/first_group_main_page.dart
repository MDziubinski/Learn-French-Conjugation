import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:french_conjugation_learn/generated/local_keys.g.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/first_group/cubit/first_group_introduction_cubit.dart';
import 'package:french_conjugation_learn/presentation/routing/main_router.gr.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';
import 'package:french_conjugation_learn/presentation/widget/common/option_tile.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class FirstGroupMainPage extends HookWidget {
  const FirstGroupMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>();
    final cubit = useBloc<FirstGroupCourseContentCubit>();
    final state = useBlocBuilder(cubit);

    useEffect(() {
      cubit.init();
    }, [cubit]);

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
          child: state.maybeWhen(
            loaded: (
              firstGroupCourse,
              progres,
            ) =>
                SingleChildScrollView(
              child: Column(
                children: [
                  OptionTile(
                    content: LocaleKeys.coursePage_introduction.tr(),
                    onTapped: () {
                      context.router.push(FirstGroupIntroductionPageRoute(
                        firstGroupCourse: firstGroupCourse,
                        cubit: cubit,
                      ));
                    },
                    available: true,
                    height: AppDimens.xxc,
                    passed: progres['firstGroupIntro'],
                  ),
                  OptionTile(
                    content: LocaleKeys.coursePage_mainRules.tr(),
                    onTapped: () {
                      context.router.push(FirstGroupMainRulesPageRoute(
                        firstGroupCourse: firstGroupCourse,
                        cubit: cubit,
                      ));
                    },
                    available: true,
                    height: AppDimens.xxc,
                    passed: progres['firstGroupMainRules'],
                  ),
                  OptionTile(
                    content: LocaleKeys.coursePage_inflectionalEndings.tr(),
                    onTapped: () {
                      context.router
                          .push(FirstGroupInflectionalEndingsPageRoute(
                        firstGroupCourse: firstGroupCourse,
                        cubit: cubit,
                      ));
                    },
                    available: true,
                    height: AppDimens.xxc,
                    passed: progres['firstGroupInflectionalEndings'],
                  ),
                  OptionTile(
                    content: LocaleKeys.coursePage_followVerb.tr(),
                    onTapped: () {
                      context.router.push(FirstGroupFollowVerbPageRoute(
                        firstGroupCourse: firstGroupCourse,
                        mainCubit: cubit,
                      ));
                    },
                    available: true,
                    height: AppDimens.xxc,
                    passed: progres['firstGroupFollowVerb'],
                  ),
                  OptionTile(
                    content: LocaleKeys.coursePage_test.tr(),
                    onTapped: () {
                      context.router.push(FirstGroupTestPageRoute(
                        mainCubit: cubit,
                      ));
                    },
                    available: true,
                    height: AppDimens.xxc,
                    passed: progres['firstGroupTest'],
                  ),
                ],
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            orElse: () => const SizedBox(),
          ),
        ),
      ),
    );
  }
}
