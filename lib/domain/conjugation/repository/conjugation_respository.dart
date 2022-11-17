import 'package:french_conjugation_learn/domain/conjugation/model/verb.dart';

abstract class ConjugationRepository {
  Future<List<Verb>> getVerbList(String searchParam);

  Future<List<Verb>> getFirstGroupVerbList();
}
