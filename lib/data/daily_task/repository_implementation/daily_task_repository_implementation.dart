import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:french_conjugation_learn/data/daily_task/dto/daily_task_dto.dart';
import 'package:french_conjugation_learn/data/daily_task/mapper/daily_task_dto_mapper.dart';
import 'package:french_conjugation_learn/domain/daily_task/model/daily_task.dart';
import 'package:french_conjugation_learn/domain/daily_task/repository/daily_task_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DailyTaskRepository)
class DailyTaskRepositoryImpl implements DailyTaskRepository {
  final DailyTaskDtoDailyTaskMapper _dailyTaskDtoDailyTaskMapper;

  DailyTaskRepositoryImpl(
    this._dailyTaskDtoDailyTaskMapper,
  );

  @override
  Future<DailyTask> getDailyTasks() async {
    final db = FirebaseFirestore.instance.collection('daily');
    List<DailyTaskDto> dailyTasks = [];

    final currentTime = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd');
    final String formattedDate = formatter.format(currentTime);

    await db.where('date', isEqualTo: formattedDate).get().then((data) {
      dailyTasks = data.docs.map((doc) {
        final tempTask = DailyTaskDto.fromJson(doc.data());
        return tempTask;
      }).toList();
    });

    final DailyTaskDto task = dailyTasks.first;

    return _dailyTaskDtoDailyTaskMapper.map(task);
  }
}
