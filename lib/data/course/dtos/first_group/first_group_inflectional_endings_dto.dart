import 'package:json_annotation/json_annotation.dart';

part 'first_group_inflectional_endings_dto.g.dart';

@JsonSerializable()
class FirstGroupInflectionalEndingsDto {
  final List<String> description;

  final Map<String, Map<String, List<String>>> mapEndings;

  const FirstGroupInflectionalEndingsDto({
    required this.description,
    required this.mapEndings,
  });

  factory FirstGroupInflectionalEndingsDto.fromJson(
          Map<String, dynamic> json) =>
      _$FirstGroupInflectionalEndingsDtoFromJson(json);
  Map<String, dynamic> toJson() =>
      _$FirstGroupInflectionalEndingsDtoToJson(this);
}
