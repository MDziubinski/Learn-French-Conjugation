import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:french_conjugation_learn/generated/local_keys.g.dart';
import 'package:french_conjugation_learn/presentation/home/cubit/main_page_cubit.dart';
import 'package:french_conjugation_learn/presentation/routing/main_router.gr.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';
import 'package:french_conjugation_learn/presentation/widget/common/custom_dialog.dart';
import 'package:french_conjugation_learn/presentation/widget/common/option_tile.dart';
import 'package:french_conjugation_learn/presentation/widget/common/side_drawer.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class MainPage extends HookWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>();
    final cubit = useBloc<MainPageCubit>();
    final state = useBlocBuilder(cubit);

    useEffect(() {
      cubit.init();
    }, [cubit]);

    return state.maybeWhen(
      idle: (
        currentUser,
        isAvailable,
      ) =>
          Scaffold(
        drawer: SideDrawer(
          available: isAvailable,
          currentUser: currentUser,
          singIn: cubit.singIn,
          singOut: cubit.singOut,
        ),
        appBar: AppBar(
          title: Text(
            'Conjugeo',
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
                    content: LocaleKeys.mainPage_checkConjguation.tr(),
                    onTappedInfo: () => showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(
                          LocaleKeys.mainPage_checkConjguation.tr(),
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
                        context.router.push(const ConjugationSearchPageRoute()),
                    available: true,
                  ),
                  OptionTile(
                    content: LocaleKeys.mainPage_dailyTask.tr(),
                    onTappedInfo: () => showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(
                          LocaleKeys.mainPage_dailyTask.tr(),
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
                    onTapped: isAvailable
                        ? () {
                            context.router.push(const DailyTaskPageRoute());
                          }
                        : () => showDialog(
                              context: context,
                              builder: (_) => AuthDialog(singIn: cubit.singIn),
                            ),
                    available: isAvailable,
                  ),
                  OptionTile(
                    content: LocaleKeys.mainPage_learnConjugation.tr(),
                    onTappedInfo: () => showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(
                          LocaleKeys.mainPage_learnConjugation.tr(),
                          style: context.style3,
                        ),
                        content: Text(
                          LocaleKeys.modulesInfo_learnConjugationInfo.tr(),
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
                    onTapped: isAvailable
                        ? () {
                            context.router
                                .push(const LearnConjugationMainPageRoute());
                          }
                        : () => showDialog(
                              context: context,
                              builder: (_) => AuthDialog(singIn: cubit.singIn),
                            ),
                    available: isAvailable,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      orElse: () => const SizedBox(),
    );
  }
}
