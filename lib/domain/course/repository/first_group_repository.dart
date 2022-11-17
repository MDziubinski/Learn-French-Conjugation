import 'package:french_conjugation_learn/domain/course/model/first_group_models/first_group_course_content.dart';
import 'package:french_conjugation_learn/domain/task/model/task_model.dart';

abstract class FirstGroupRepository {
  Future<FirstGroupCourse> getFirstGroupCourseContent();

  Future<List<TaskModel>> getTestTasks();
}
