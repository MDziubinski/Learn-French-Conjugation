import 'package:json_annotation/json_annotation.dart';

part 'course_introduction_dto.g.dart';

@JsonSerializable()
class CourseIntroductionDto {
  String introductionDescription;
  String firstGroupVerbsDescription;
  String secondGroupVerbsDescription;
  String thirdGroupVerbsDescription;

  CourseIntroductionDto({
    required this.introductionDescription,
    required this.firstGroupVerbsDescription,
    required this.secondGroupVerbsDescription,
    required this.thirdGroupVerbsDescription,
  });

  factory CourseIntroductionDto.fromJson(Map<String, dynamic> json) =>
      _$CourseIntroductionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CourseIntroductionDtoToJson(this);
}
