import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:french_conjugation_learn/domain/enums/task/task_type.dart';
import 'package:french_conjugation_learn/domain/task/model/task_model.dart';
import 'package:french_conjugation_learn/generated/local_keys.g.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/first_group/cubit/first_group_introduction_cubit.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/first_group/cubit/first_group_test_page_cubit.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/first_group/cubit/first_group_test_page_state.dart';
import 'package:french_conjugation_learn/presentation/routing/main_router.gr.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';
import 'package:french_conjugation_learn/presentation/widget/tasks/introduction_task/introduction_task.dart';
import 'package:french_conjugation_learn/presentation/widget/tasks/multi_choice_task/widget/multi_choice_task.dart';
import 'package:french_conjugation_learn/presentation/widget/tasks/single_choice_task/widget/single_choice_task.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class FirstGroupTestPage extends HookWidget {
  final FirstGroupCourseContentCubit mainCubit;
  const FirstGroupTestPage({
    required this.mainCubit,
    super.key,
  });

  void _cubitListener(
    FirstGroupTestPageCubit cubit,
    FirstGroupTestPageState state,
    BuildContext context,
  ) {
    state.maybeWhen(
      finished: (passedTasks, tasks, passedTest) {
        if (passedTest) mainCubit.updateProgres('firstGroupTest');
        context.router.replace(FirstGroupTestResultPageRoute(
          passedTasks: passedTasks,
          tasks: tasks,
          passedTest: passedTest,
          cubit: mainCubit,
        ));
      },
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>()!;
    final cubit = useBloc<FirstGroupTestPageCubit>();
    final state = useBlocBuilder(cubit);
    useBlocListener(cubit, _cubitListener);

    useEffect(() {
      cubit.init();
    }, [cubit]);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text(
          LocaleKeys.firstGroup_firstGroupTest.tr(),
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
