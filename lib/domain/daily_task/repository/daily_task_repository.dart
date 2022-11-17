import 'package:french_conjugation_learn/domain/daily_task/model/daily_task.dart';

abstract class DailyTaskRepository {
  Future<DailyTask> getDailyTasks();
}
