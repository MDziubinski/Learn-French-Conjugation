import 'package:french_conjugation_learn/data/common/data_mapper.dart';
import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_inflectional_endings_dto.dart';
import 'package:french_conjugation_learn/domain/course/model/first_group_models/first_group_inflectional_endings.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirstGroupInflectionalEndingsDtoMapper extends DataMapper<
    FirstGroupInflectionalEndingsDto, FirstGroupInflectionalEndings> {
  @override
  FirstGroupInflectionalEndings map(FirstGroupInflectionalEndingsDto data) {
    return FirstGroupInflectionalEndings(
      description: data.description,
      mapEndings: data.mapEndings,
    );
  }
}
