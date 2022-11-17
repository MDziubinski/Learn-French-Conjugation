import 'package:json_annotation/json_annotation.dart';

part 'first_group_introduction_dto.g.dart';

@JsonSerializable()
class FirstGroupIntroductionDto {
  final List<String> description;
  const FirstGroupIntroductionDto({required this.description});

  factory FirstGroupIntroductionDto.fromJson(Map<String, dynamic> json) =>
      _$FirstGroupIntroductionDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FirstGroupIntroductionDtoToJson(this);
}
