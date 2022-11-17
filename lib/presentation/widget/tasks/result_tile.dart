import 'package:flutter/material.dart';
import 'package:french_conjugation_learn/domain/task/model/task_model.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';

class ResultTile extends StatelessWidget {
  const ResultTile({
    required this.passedTask,
    required this.currentTask,
    Key? key,
  }) : super(key: key);

  final bool passedTask;
  final TaskModel currentTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.m),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.m),
        height: AppDimens.xxxxc,
        decoration: BoxDecoration(
          color: context.primary100,
          borderRadius: BorderRadius.circular(AppDimens.m),
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 4,
              child: Text(currentTask.question),
            ),
            Flexible(
              child: Center(
                child: passedTask
                    ? const Icon(Icons.check)
                    : const Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
