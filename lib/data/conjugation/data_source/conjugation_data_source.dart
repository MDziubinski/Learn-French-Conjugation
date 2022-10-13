// import 'package:dio/dio.dart';
// import 'package:french_conjugation_learn/data/conjugation/dtos/verb_dto.dart';
// import 'dart:convert';
// import 'dart:io';

// import 'package:injectable/injectable.dart';

// part 'conjugation_data_source.g.dart';

// @Singleton()
// @RestApi()
// abstract class ConjugationDataSource {
//   @factoryMethod
//   factory ConjugationDataSource(Dio dio) = _ConjugationDataSource;


//   Future<List<VerbDto>> getVerbs(String searchParam) async {
//     final input = await File('abattre.json').readAsString();
//     print(input);
//     return [];
//   }
// }
