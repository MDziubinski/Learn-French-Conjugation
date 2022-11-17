import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_course_dto.dart';
import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_test_task_dto.dart';
import 'package:french_conjugation_learn/data/course/mapper/first_group/first_group_course_dto_mapper.dart';
import 'package:french_conjugation_learn/data/course/mapper/first_group/first_group_test_task_dto_mapper.dart';
import 'package:french_conjugation_learn/domain/course/model/first_group_models/first_group_course_content.dart';
import 'package:french_conjugation_learn/domain/course/repository/first_group_repository.dart';
import 'package:french_conjugation_learn/domain/task/model/task_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FirstGroupRepository)
class FirstGroupRepositoryImpl implements FirstGroupRepository {
  final FirstGroupCourseDtoMapper _firstGroupCourseDtoMapper;
  final TaskDtoMapper _taskDtoMapper;

  FirstGroupRepositoryImpl(
    this._firstGroupCourseDtoMapper,
    this._taskDtoMapper,
  );

  @override
  Future<FirstGroupCourse> getFirstGroupCourseContent() async {
    final db = FirebaseFirestore.instance.collection('course');
    late FirstGroupCourseDto tempIntro;

    await db.doc("firstGroup").get().then((doc) {
      final tempMap = doc.data();

      if (tempMap != null) {
        tempIntro = FirstGroupCourseDto.fromJson(doc.data()!);
      }
    });

    return _firstGroupCourseDtoMapper.map(tempIntro);
  }

  @override
  Future<List<TaskModel>> getTestTasks() async {
    final db = FirebaseFirestore.instance.collection('course');
    final tasksDb = db.doc("firstGroup").collection("tasks");

    final List<TaskDto> tasks = [];

    await tasksDb.doc("task").get().then((doc) {
      final tempMap = doc.data();

      if (tempMap != null) {
        final taskListDto = tempMap.values.first;
        for (final element in taskListDto) {
          tasks.add(TaskDto.fromJson(element as Map<String, dynamic>));
        }
      }
    });

    final List<TaskModel> mappedTasks = [];

    for (final task in tasks) {
      mappedTasks.add(_taskDtoMapper.map(task));
    }

    return mappedTasks;
  }
}
