import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:french_conjugation_learn/generated/local_keys.g.dart';
import 'package:french_conjugation_learn/presentation/daily_tasks/cubit/daily_task_cubit.dart';
import 'package:french_conjugation_learn/presentation/routing/main_router.gr.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';
import 'package:french_conjugation_learn/presentation/widget/common/option_tile.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class DailyTaskPage extends HookWidget {
  const DailyTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>()!;
    final cubit = useBloc<DailyTaskCubit>();
    final state = useBlocBuilder(cubit);

    useEffect(() {
      cubit.init();
    }, [cubit]);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.mainPage_dailyTask.tr(),
          style: theme.style2.copyWith(color: theme.main),
        ),
        backgroundColor: theme.tabBar,
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
            notDone: () => OptionTile(
              content: LocaleKeys.mainPage_dailyTask.tr(),
              onTapped: () {
                context.router.replace(const DailyTaskTestPageRoute());
              },
              available: true,
            ),
            done: () => Padding(
              padding: const EdgeInsets.all(AppDimens.m),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.dailyTask_alreadyDone.tr(),
                    style: theme.style2,
                  ),
                  const SizedBox(height: AppDimens.m),
                  Text(
                    LocaleKeys.dailyTask_tomorrow.tr(),
                    style: theme.style4,
                  ),
                ],
              ),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            orElse: () => const SizedBox(),
          ),
        ),
      ),
    );
  }
}
