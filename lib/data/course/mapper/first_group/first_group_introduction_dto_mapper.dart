import 'package:french_conjugation_learn/data/common/data_mapper.dart';
import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_introduction_dto.dart';
import 'package:french_conjugation_learn/domain/course/model/first_group_models/first_group_introduction.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirstGroupIntroductionDtoMapper
    extends DataMapper<FirstGroupIntroductionDto, FirstGroupIntroduction> {
  @override
  FirstGroupIntroduction map(FirstGroupIntroductionDto data) {
    return FirstGroupIntroduction(description: data.description);
  }
}
