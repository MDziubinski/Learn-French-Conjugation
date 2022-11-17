import 'package:french_conjugation_learn/data/common/data_mapper.dart';
import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_test_task_answer_dto.dart';
import 'package:french_conjugation_learn/domain/task/model/answer_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class TestTaskAnswerDtoMapper
    extends DataMapper<TestTaskAnswerDto, AnswerModel> {
  @override
  AnswerModel map(TestTaskAnswerDto data) {
    return AnswerModel(
      answer: data.answer,
      identifier: data.identifier,
    );
  }
}
