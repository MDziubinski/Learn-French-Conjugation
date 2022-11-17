import 'package:json_annotation/json_annotation.dart';

part 'first_group_test_task_answer_dto.g.dart';

@JsonSerializable()
class TestTaskAnswerDto {
  final String identifier;
  final String answer;

  const TestTaskAnswerDto({
    required this.answer,
    required this.identifier,
  });

  factory TestTaskAnswerDto.fromJson(Map<String, dynamic> json) =>
      _$TestTaskAnswerDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TestTaskAnswerDtoToJson(this);
}
