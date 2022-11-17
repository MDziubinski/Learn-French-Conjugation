import 'package:french_conjugation_learn/domain/course/model/first_group_models/first_group_course_content.dart';
import 'package:french_conjugation_learn/domain/course/repository/first_group_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFirstGroupCourseContentUseCase {
  final FirstGroupRepository _firstGroupRepository;

  GetFirstGroupCourseContentUseCase(this._firstGroupRepository);

  Future<FirstGroupCourse> call() async {
    return await _firstGroupRepository.getFirstGroupCourseContent();
  }
}
