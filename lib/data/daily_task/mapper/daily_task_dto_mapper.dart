import 'package:french_conjugation_learn/data/common/data_mapper.dart';
import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_test_task_dto.dart';
import 'package:french_conjugation_learn/data/course/mapper/first_group/first_group_test_task_dto_mapper.dart';
import 'package:french_conjugation_learn/data/daily_task/dto/daily_task_dto.dart';
import 'package:french_conjugation_learn/domain/daily_task/model/daily_task.dart';
import 'package:french_conjugation_learn/domain/task/model/task_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class DailyTaskDtoDailyTaskMapper extends DataMapper<DailyTaskDto, DailyTask> {
  final TaskDtoMapper taskDtoMapper;
  DailyTaskDtoDailyTaskMapper({required this.taskDtoMapper});

  @override
  DailyTask map(DailyTaskDto data) {
    return DailyTask(
      date: data.date,
      tasks: _mapTasks(data.tasks),
    );
  }

  List<TaskModel> _mapTasks(List<TaskDto> tasks) {
    final List<TaskModel> mappedTasks = [];

    for (final task in tasks) {
      mappedTasks.add(taskDtoMapper.map(task));
    }
    return mappedTasks;
  }
}
