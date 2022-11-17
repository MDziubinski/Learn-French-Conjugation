import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_test_task_answer_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'first_group_test_task_dto.g.dart';

@JsonSerializable()
class TaskDto {
  final String question;
  final String taskType;
  final List<TestTaskAnswerDto> answers;
  final List<String> correctAnswers;

  const TaskDto({
    required this.question,
    required this.taskType,
    required this.answers,
    required this.correctAnswers,
  });

  factory TaskDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TaskDtoToJson(this);
}
