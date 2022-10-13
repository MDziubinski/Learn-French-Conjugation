import 'package:french_conjugation_learn/domain/conjugation/model/verb.dart';
import 'package:french_conjugation_learn/domain/conjugation/repository/conjugation_respository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetConjugationUseCase {
  final ConjugationRepository _cojugationRepository;

  GetConjugationUseCase(this._cojugationRepository);

  Future<List<Verb>> call(String searchParam) async {
    final verbList = await _cojugationRepository.getVerbList(searchParam);
    return verbList;
  }
}
