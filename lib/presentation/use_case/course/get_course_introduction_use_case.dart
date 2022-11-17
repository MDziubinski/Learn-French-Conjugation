import 'package:french_conjugation_learn/domain/course/model/course_introduction.dart';
import 'package:french_conjugation_learn/domain/course/repository/course_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCourseIntroductionUseCase {
  final CourseRepository _courseRepository;

  GetCourseIntroductionUseCase(this._courseRepository);

  Future<CourseIntroduction> call() async {
    return await _courseRepository.getCourseIntroduction();
  }
}
