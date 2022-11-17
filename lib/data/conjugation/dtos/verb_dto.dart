import 'package:json_annotation/json_annotation.dart';

part 'verb_dto.g.dart';

@JsonSerializable()
class VerbDto {
  String infinitif;
  String participePresent;
  String participePasse;
  String auxiliaire;
  String formePronominale;
  String formeNonPronominale;
  String description;
  int verbGroup;
  List<String> translationExamplesF;
  List<String> translationExamplesEng;
  List<String> present;
  List<String> imparfait;
  List<String> passeSimple;
  List<String> futurSimple;
  List<String> passeCompose;
  List<String> plusQueParfait;
  List<String> passeAnterieur;
  List<String> futurAnterieur;
  List<String> subjonctifPresent;
  List<String> subjonctifImparfait;
  List<String> subjonctifPasse;
  List<String> subjonctifPlusQueParfait;
  List<String> conditionnelPresent;
  List<String> conditionnelPasse;
  List<String> conditionnelPasseII;
  List<String> imperatif;
  List<String> imperatifPasse;

  VerbDto({
    required this.infinitif,
    required this.participePresent,
    required this.participePasse,
    required this.auxiliaire,
    required this.formePronominale,
    required this.formeNonPronominale,
    required this.present,
    required this.imparfait,
    required this.passeSimple,
    required this.futurSimple,
    required this.passeCompose,
    required this.plusQueParfait,
    required this.passeAnterieur,
    required this.futurAnterieur,
    required this.subjonctifPresent,
    required this.subjonctifImparfait,
    required this.subjonctifPasse,
    required this.subjonctifPlusQueParfait,
    required this.conditionnelPresent,
    required this.conditionnelPasse,
    required this.conditionnelPasseII,
    required this.imperatif,
    required this.imperatifPasse,
    required this.description,
    required this.translationExamplesEng,
    required this.translationExamplesF,
    required this.verbGroup,
  });

  factory VerbDto.fromJson(Map<String, dynamic> json) =>
      _$VerbDtoFromJson(json);
  Map<String, dynamic> toJson() => _$VerbDtoToJson(this);
}
