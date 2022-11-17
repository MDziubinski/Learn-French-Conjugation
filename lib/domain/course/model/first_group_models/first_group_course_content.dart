import 'package:french_conjugation_learn/domain/course/model/first_group_models/first_group_follow_verb.dart';
import 'package:french_conjugation_learn/domain/course/model/first_group_models/first_group_inflectional_endings.dart';
import 'package:french_conjugation_learn/domain/course/model/first_group_models/first_group_introduction.dart';
import 'package:french_conjugation_learn/domain/course/model/first_group_models/first_group_main_rules.dart';

class FirstGroupCourse {
  final FirstGroupIntroduction introduction;
  final FirstGroupMainRules mainRules;
  final FirstGroupFollowVerb followVerb;
  final FirstGroupInflectionalEndings inflectionalEndings;

  FirstGroupCourse({
    required this.introduction,
    required this.mainRules,
    required this.followVerb,
    required this.inflectionalEndings,
  });
}
