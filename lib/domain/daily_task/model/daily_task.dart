import 'package:french_conjugation_learn/domain/task/model/task_model.dart';

class DailyTask {
  final List<TaskModel> tasks;
  final String date;

  const DailyTask({
    required this.date,
    required this.tasks,
  });
}
