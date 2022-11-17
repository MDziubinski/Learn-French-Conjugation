import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:french_conjugation_learn/domain/enums/task/task_type.dart';
import 'package:french_conjugation_learn/domain/task/model/task_model.dart';
import 'package:french_conjugation_learn/generated/local_keys.g.dart';
import 'package:french_conjugation_learn/presentation/daily_tasks/cubit/daily_task_test_cubit.dart';
import 'package:french_conjugation_learn/presentation/daily_tasks/cubit/daily_task_test_state.dart';
import 'package:french_conjugation_learn/presentation/routing/main_router.gr.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';
import 'package:french_conjugation_learn/presentation/widget/tasks/introduction_task/introduction_task.dart';
import 'package:french_conjugation_learn/presentation/widget/tasks/multi_choice_task/widget/multi_choice_task.dart';
import 'package:french_conjugation_learn/presentation/widget/tasks/single_choice_task/widget/single_choice_task.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class DailyTaskTestPage extends HookWidget {
  const DailyTaskTestPage({Key? key}) : super(key: key);

  void _cubitListener(
    DailyTaskTestCubit cubit,
    DailyTaskTestState state,
    BuildContext context,
  ) {
    state.maybeWhen(
      finished: (passedTasks, tasks, passedTest) {
        cubit.updateDailyTaskDate();
        context.router.replace(DailyTaskTestResultPageRoute(
          passedTasks: passedTasks,
          tasks: tasks,
          passedTest: passedTest,
        ));
      },
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>()!;
    final cubit = useBloc<DailyTaskTestCubit>();
    final state = useBlocBuilder(cubit);
    useBlocListener(cubit, _cubitListener);

    useEffect(() {
      cubit.init();
    }, [cubit]);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.mainPage_dailyTask.tr(),
          style: theme.style2.copyWith(color: theme.main),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppDimens.m),
            child: Center(
              child: state.maybeWhen(
                loaded: (tasks, taskIndex, isFinal) => Text(
                  'Q${taskIndex + 1}',
                  style: theme.style2,
                ),
                orElse: () => const SizedBox(),
              ),
            ),
          ),
        ],
        backgroundColor: theme.tabBar,
      ),
      body: state.maybeWhen(
        loaded: (tasks, taskIndex, isFinal) => _getTaskWidget(
          tasks[taskIndex],
          cubit.nextQuestion,
          isFinal,
        ),
        orElse: () => const SizedBox(),
      ),
    );
  }

  Widget _getTaskWidget(
    TaskModel currentTask,
    Function(bool) nextTask,
    bool isFinal,
  ) {
    switch (currentTask.taskType) {
      case TaskType.trueFalse:
        return SingleChoiceTask(
          currentTask: currentTask,
          nextTask: nextTask,
          isFinalTask: isFinal,
        );

      case TaskType.singleChoice:
        return SingleChoiceTask(
          currentTask: currentTask,
          nextTask: nextTask,
          isFinalTask: isFinal,
        );

      case TaskType.multiChoice:
        return MultiChoiceTask(
          currentTask: currentTask,
          nextTask: nextTask,
          isFinalTask: isFinal,
        );

      case TaskType.introduction:
        return IntroductionTask(
          nextTask: nextTask,
        );
    }
  }
}
