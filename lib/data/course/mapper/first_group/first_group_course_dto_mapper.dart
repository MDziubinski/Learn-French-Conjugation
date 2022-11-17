import 'package:french_conjugation_learn/data/common/data_mapper.dart';
import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_course_dto.dart';
import 'package:french_conjugation_learn/data/course/mapper/first_group/first_group_inflectional_endings_dto_mapper.dart';
import 'package:french_conjugation_learn/data/course/mapper/first_group/first_group_introduction_dto_mapper.dart';
import 'package:french_conjugation_learn/data/course/mapper/first_group/first_group_main_rules_dto_mapper.dart';
import 'package:french_conjugation_learn/domain/course/model/first_group_models/first_group_course_content.dart';
import 'package:injectable/injectable.dart';

import 'first_group_follow_verb_dto_mapper.dart';

@injectable
class FirstGroupCourseDtoMapper
    extends DataMapper<FirstGroupCourseDto, FirstGroupCourse> {
  final FirstGroupIntroductionDtoMapper firstGroupIntroductionDtoMapper;
  final FirstGroupMainRulesDtoMapper firstGroupMainRulesDtoMapper;
  final FirstGroupInflectionalEndingsDtoMapper
      firstGroupInflectionalEndingsDtoMapper;
  final FirstGroupFollowVerbDtoMapper firstGroupFollowVerbDtoMapper;

  FirstGroupCourseDtoMapper({
    required this.firstGroupIntroductionDtoMapper,
    required this.firstGroupMainRulesDtoMapper,
    required this.firstGroupInflectionalEndingsDtoMapper,
    required this.firstGroupFollowVerbDtoMapper,
  });

  @override
  FirstGroupCourse map(FirstGroupCourseDto data) {
    return FirstGroupCourse(
      introduction:
          firstGroupIntroductionDtoMapper.map(data.courseIntroduction),
      mainRules: firstGroupMainRulesDtoMapper.map(data.mainRules),
      followVerb: firstGroupFollowVerbDtoMapper.map(data.followVerb),
      inflectionalEndings:
          firstGroupInflectionalEndingsDtoMapper.map(data.inflectionalEndings),
    );
  }
}
