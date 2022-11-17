import 'package:flutter_test/flutter_test.dart';
import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_test_task_answer_dto.dart';
import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_test_task_dto.dart';
import 'package:french_conjugation_learn/data/course/mapper/first_group/first_group_test_answer_dto_mapper.dart';
import 'package:french_conjugation_learn/data/course/mapper/first_group/first_group_test_task_dto_mapper.dart';
import 'package:french_conjugation_learn/domain/enums/task/task_type.dart';

void main() {
  const answerDTO = TestTaskAnswerDto(
    answer: '',
    identifier: '',
  );

  const taskDTO = TaskDto(
    question: '',
    taskType: 'singleChoice',
    answers: [answerDTO],
    correctAnswers: [''],
  );

  final firstGroupTestTaskAnswerDtoMapper = TestTaskAnswerDtoMapper();
  final mapper = TaskDtoMapper(firstGroupTestTaskAnswerDtoMapper);

  test('Test TaskDtoMapper', () {
    final mappedTask = mapper.map(taskDTO);

    expect(mappedTask.question, mappedTask.question);
    expect(mappedTask.correctAnswers, mappedTask.correctAnswers);
    expect(mappedTask.taskType, TaskType.singleChoice);
  });
}
