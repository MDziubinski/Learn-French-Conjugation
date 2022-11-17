import 'package:french_conjugation_learn/data/common/data_mapper.dart';
import 'package:french_conjugation_learn/data/course/dtos/course_introduction_dto.dart';
import 'package:french_conjugation_learn/domain/course/model/course_introduction.dart';
import 'package:injectable/injectable.dart';

@injectable
class CourseIntroductionDtoToCourseIntroductionMapper
    extends DataMapper<CourseIntroductionDto, CourseIntroduction> {
  @override
  CourseIntroduction map(CourseIntroductionDto data) {
    return CourseIntroduction(courseDescriptions: _mapToList(data));
  }

  List<String> _mapToList(CourseIntroductionDto data) {
    final List<String> tempList = [];

    tempList.add(data.introductionDescription);
    tempList.add(data.firstGroupVerbsDescription);
    tempList.add(data.secondGroupVerbsDescription);
    tempList.add(data.thirdGroupVerbsDescription);

    return tempList;
  }
}
