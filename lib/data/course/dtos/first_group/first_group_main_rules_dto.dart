import 'package:json_annotation/json_annotation.dart';

part 'first_group_main_rules_dto.g.dart';

@JsonSerializable()
class FirstGroupMainRulesDto {
  final List<String> description;

  const FirstGroupMainRulesDto({required this.description});

  factory FirstGroupMainRulesDto.fromJson(Map<String, dynamic> json) =>
      _$FirstGroupMainRulesDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FirstGroupMainRulesDtoToJson(this);
}
