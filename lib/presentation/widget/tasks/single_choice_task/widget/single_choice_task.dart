import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:french_conjugation_learn/domain/task/model/task_model.dart';
import 'package:french_conjugation_learn/generated/local_keys.g.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';
import 'package:french_conjugation_learn/presentation/widget/common/answer_card.dart';
import 'package:french_conjugation_learn/presentation/widget/common/custom_animated_button.dart';
import 'package:french_conjugation_learn/presentation/widget/tasks/single_choice_task/cubit/single_choice_task_cubit.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class SingleChoiceTask extends HookWidget {
  const SingleChoiceTask({
    required this.currentTask,
    required this.nextTask,
    required this.isFinalTask,
    Key? key,
  }) : super(key: key);

  final TaskModel currentTask;
  final Function(bool) nextTask;
  final bool isFinalTask;

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<SingleChoiceTaskCubit>();
    final state = useBlocBuilder(cubit);

    final theme = Theme.of(context).extension<CustomAppTheme>()!;

    useEffect(() {
      cubit.init(currentTask);
    }, [
      cubit,
      currentTask,
    ]);

    return state.maybeWhen(
      idle: (
        chosenAnswer,
        answers,
        isAnswerChosen,
      ) =>
          Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.m, vertical: AppDimens.xl),
                child: Text(
                  currentTask.question,
                  style: theme.style11,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.sm),
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: AppDimens.l),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: AppDimens.sm),
                  itemCount: answers.length,
                  itemBuilder: (context, index) {
                    return CustomAnimatedButton(
                      inactiveColors: [theme.white, theme.main],
                      activeColors: [theme.primary100, theme.main],
                      builder: (colors) => AnswerCard(
                        onTap: () {
                          cubit.updateChoosenAnswer(index);
                        },
                        answer: answers[index],
                        colors: colors,
                      ),
                      isActive: chosenAnswer[index],
                    );
                  },
                ),
              ),
            ],
          ),
          Column(
            children: [
              CustomAnimatedButton(
                inactiveColors: [theme.grey30, theme.main],
                activeColors: [theme.primary100, theme.main],
                builder: (colors) => AnswerCard(
                  onTap: () {
                    nextTask(cubit.checkAnswers());
                  },
                  answer: isFinalTask
                      ? LocaleKeys.test_finish.tr()
                      : LocaleKeys.test_next.tr(),
                  colors: colors,
                ),
                isActive: isAnswerChosen,
              ),
              const SizedBox(height: AppDimens.c)
            ],
          ),
        ],
      ),
      orElse: () => const SizedBox(),
    );
  }
}
