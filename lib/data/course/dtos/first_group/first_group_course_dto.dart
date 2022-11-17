import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_follow_verb_dto.dart';
import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_inflectional_endings_dto.dart';
import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_introduction_dto.dart';
import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_main_rules_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'first_group_course_dto.g.dart';

@JsonSerializable()
class FirstGroupCourseDto {
  final FirstGroupIntroductionDto courseIntroduction;
  final FirstGroupMainRulesDto mainRules;
  final FirstGroupFollowVerbDto followVerb;
  final FirstGroupInflectionalEndingsDto inflectionalEndings;

  const FirstGroupCourseDto({
    required this.courseIntroduction,
    required this.mainRules,
    required this.followVerb,
    required this.inflectionalEndings,
  });

  factory FirstGroupCourseDto.fromJson(Map<String, dynamic> json) =>
      _$FirstGroupCourseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FirstGroupCourseDtoToJson(this);
}
