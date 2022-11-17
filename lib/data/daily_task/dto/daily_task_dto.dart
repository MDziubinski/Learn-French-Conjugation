import 'package:french_conjugation_learn/data/course/dtos/first_group/first_group_test_task_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_task_dto.g.dart';

@JsonSerializable()
class DailyTaskDto {
  final List<TaskDto> tasks;
  final String date;

  const DailyTaskDto({
    required this.date,
    required this.tasks,
  });

  factory DailyTaskDto.fromJson(Map<String, dynamic> json) =>
      _$DailyTaskDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DailyTaskDtoToJson(this);
}
