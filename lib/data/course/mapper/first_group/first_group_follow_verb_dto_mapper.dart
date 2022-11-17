import 'package:french_conjugation_learn/data/common/data_mapper.dart';
import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_follow_verb_dto.dart';
import 'package:french_conjugation_learn/domain/course/model/first_group_models/first_group_follow_verb.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirstGroupFollowVerbDtoMapper
    extends DataMapper<FirstGroupFollowVerbDto, FirstGroupFollowVerb> {
  @override
  FirstGroupFollowVerb map(FirstGroupFollowVerbDto data) {
    return FirstGroupFollowVerb(description: data.description);
  }
}
