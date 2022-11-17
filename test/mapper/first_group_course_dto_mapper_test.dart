import 'package:flutter_test/flutter_test.dart';
import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_course_dto.dart';
import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_follow_verb_dto.dart';
import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_inflectional_endings_dto.dart';
import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_introduction_dto.dart';
import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_main_rules_dto.dart';
import 'package:french_conjugation_learn/data/course/mapper/first_group/first_group_course_dto_mapper.dart';
import 'package:french_conjugation_learn/data/course/mapper/first_group/first_group_follow_verb_dto_mapper.dart';
import 'package:french_conjugation_learn/data/course/mapper/first_group/first_group_inflectional_endings_dto_mapper.dart';
import 'package:french_conjugation_learn/data/course/mapper/first_group/first_group_introduction_dto_mapper.dart';
import 'package:french_conjugation_learn/data/course/mapper/first_group/first_group_main_rules_dto_mapper.dart';

void main() {
  const firstGroupIntroductionDto = FirstGroupIntroductionDto(description: []);
  const firstGroupMainRulesDto = FirstGroupMainRulesDto(description: []);
  const firstGroupFollowVerbDto = FirstGroupFollowVerbDto(description: []);
  const firstGroupInflectionalEndingsDto = FirstGroupInflectionalEndingsDto(
    description: [],
    mapEndings: {
      '': {'': []}
    },
  );

  const firstGroupCourseDto = FirstGroupCourseDto(
    courseIntroduction: firstGroupIntroductionDto,
    mainRules: firstGroupMainRulesDto,
    followVerb: firstGroupFollowVerbDto,
    inflectionalEndings: firstGroupInflectionalEndingsDto,
  );

  final firstGroupIntroductionDtoMapper = FirstGroupIntroductionDtoMapper();
  final firstGroupMainRulesDtoMapper = FirstGroupMainRulesDtoMapper();
  final firstGroupInflectionalEndingsDtoMapper =
      FirstGroupInflectionalEndingsDtoMapper();
  final firstGroupFollowVerbDtoMapper = FirstGroupFollowVerbDtoMapper();

  final mapper = FirstGroupCourseDtoMapper(
    firstGroupIntroductionDtoMapper: firstGroupIntroductionDtoMapper,
    firstGroupMainRulesDtoMapper: firstGroupMainRulesDtoMapper,
    firstGroupInflectionalEndingsDtoMapper:
        firstGroupInflectionalEndingsDtoMapper,
    firstGroupFollowVerbDtoMapper: firstGroupFollowVerbDtoMapper,
  );

  test('Test FirstGroupCourseDtoMapper', () {
    final mappedFirstGroupCourse = mapper.map(firstGroupCourseDto);

    expect(mappedFirstGroupCourse.followVerb.description,
        firstGroupCourseDto.followVerb.description);
    expect(mappedFirstGroupCourse.introduction.description,
        firstGroupCourseDto.courseIntroduction.description);
    expect(mappedFirstGroupCourse.inflectionalEndings.description,
        firstGroupCourseDto.inflectionalEndings.description);
    expect(mappedFirstGroupCourse.mainRules.description,
        firstGroupCourseDto.mainRules.description);
  });
}
