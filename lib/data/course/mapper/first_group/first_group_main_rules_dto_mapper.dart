import 'package:french_conjugation_learn/data/common/data_mapper.dart';
import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_main_rules_dto.dart';
import 'package:french_conjugation_learn/domain/course/model/first_group_models/first_group_main_rules.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirstGroupMainRulesDtoMapper
    extends DataMapper<FirstGroupMainRulesDto, FirstGroupMainRules> {
  @override
  FirstGroupMainRules map(FirstGroupMainRulesDto data) {
    return FirstGroupMainRules(description: data.description);
  }
}
