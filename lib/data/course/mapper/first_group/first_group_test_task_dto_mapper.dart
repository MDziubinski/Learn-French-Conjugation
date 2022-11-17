import 'package:french_conjugation_learn/data/common/data_mapper.dart';
import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_test_task_answer_dto.dart';
import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_test_task_dto.dart';
import 'package:french_conjugation_learn/data/course/mapper/first_group/first_group_test_answer_dto_mapper.dart';
import 'package:french_conjugation_learn/domain/enums/task/task_type.dart';
import 'package:french_conjugation_learn/domain/task/model/answer_model.dart';
import 'package:french_conjugation_learn/domain/task/model/task_model.dart';
import 'package:injectable/injectable.dart';

const Map<String, TaskType> _mapToTaskType = {
  'singleChoice': TaskType.singleChoice,
  'introduction': TaskType.introduction,
  'trueFalse': TaskType.trueFalse,
  'multiChoice': TaskType.multiChoice,
};

@injectable
class TaskDtoMapper extends DataMapper<TaskDto, TaskModel> {
  final TestTaskAnswerDtoMapper firstGroupTestTaskAnswerDtoMapper;

  TaskDtoMapper(this.firstGroupTestTaskAnswerDtoMapper);

  @override
  TaskModel map(TaskDto data) {
    return TaskModel(
        taskType: _mapToTaskType[data.taskType]!,
        question: data.question,
        answers: mapAnswers(
          firstGroupTestTaskAnswerDtoMapper,
          data.answers,
        ),
        correctAnswers: data.correctAnswers);
  }

  List<AnswerModel> mapAnswers(
      TestTaskAnswerDtoMapper firstGroupTestTaskAnswerDtoMapper,
      List<TestTaskAnswerDto> answers) {
    final List<AnswerModel> answersList = [];

    for (final answer in answers) {
      answersList.add(firstGroupTestTaskAnswerDtoMapper.map(answer));
    }
    return answersList;
  }
}
