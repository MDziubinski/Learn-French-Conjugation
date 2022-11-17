import 'package:french_conjugation_learn/domain/course/model/course_introduction.dart';

abstract class CourseRepository {
  Future<CourseIntroduction> getCourseIntroduction();
}
