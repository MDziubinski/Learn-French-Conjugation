import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:french_conjugation_learn/data/conjugation/dtos/verb_dto.dart';
import 'package:french_conjugation_learn/data/conjugation/mappers/verb_dto_to_verb_mapper.dart';
import 'package:french_conjugation_learn/domain/conjugation/model/verb.dart';
import 'package:french_conjugation_learn/domain/conjugation/repository/conjugation_respository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ConjugationRepository)
class ProductListRepositoryImpl implements ConjugationRepository {
  final VerbDtoToVerbMapper _verbDtoToVerbMapper;
  List<VerbDto> _verbsList = [];
  ProductListRepositoryImpl(this._verbDtoToVerbMapper);
  @override
  Future<List<Verb>> getVerbList(String searchParam) async {
    final db = FirebaseFirestore.instance.collection('verbs');

    await db.where('caseSearch', arrayContains: searchParam).get().then(
      (data) {
        _verbsList = data.docs.map((doc) {
          final temp = VerbDto.fromJson(doc.data());
          return temp;
        }).toList();
      },
    );

    return _verbsList.map((verb) => _verbDtoToVerbMapper.map(verb)).toList();
  }
}
