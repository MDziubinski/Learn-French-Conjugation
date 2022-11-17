import 'package:json_annotation/json_annotation.dart';

part 'first_group_follow_verb_dto.g.dart';

@JsonSerializable()
class FirstGroupFollowVerbDto {
  final List<String> description;
  const FirstGroupFollowVerbDto({required this.description});

  factory FirstGroupFollowVerbDto.fromJson(Map<String, dynamic> json) =>
      _$FirstGroupFollowVerbDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FirstGroupFollowVerbDtoToJson(this);
}
