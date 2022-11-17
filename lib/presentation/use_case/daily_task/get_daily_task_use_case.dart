import 'package:french_conjugation_learn/domain/daily_task/model/daily_task.dart';
import 'package:french_conjugation_learn/domain/daily_task/repository/daily_task_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetDailyTasksUseCase {
  final DailyTaskRepository _dailyTaskRepository;

  GetDailyTasksUseCase(this._dailyTaskRepository);

  Future<DailyTask> call() async {
    return await _dailyTaskRepository.getDailyTasks();
  }
}
