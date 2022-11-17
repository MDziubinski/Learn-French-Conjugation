import 'package:json_annotation/json_annotation.dart';

part 'custom_user_dto.g.dart';

@JsonSerializable()
class CustomUserDto {
  final String email;
  final String name;
  final String profilePic;
  final String dailyTaskDate;
  final Map<String, bool> progres;

  const CustomUserDto({
    required this.email,
    required this.name,
    required this.profilePic,
    required this.progres,
    required this.dailyTaskDate,
  });

  factory CustomUserDto.fromJson(Map<String, dynamic> json) =>
      _$CustomUserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CustomUserDtoToJson(this);
}
