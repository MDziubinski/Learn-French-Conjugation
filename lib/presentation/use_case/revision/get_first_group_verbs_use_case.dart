import 'package:french_conjugation_learn/domain/conjugation/model/verb.dart';
import 'package:french_conjugation_learn/domain/conjugation/repository/conjugation_respository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFirstGroupVerbsUseCase {
  final ConjugationRepository _cojugationRepository;

  GetFirstGroupVerbsUseCase(this._cojugationRepository);

  Future<List<Verb>> call() async {
    return await _cojugationRepository.getFirstGroupVerbList();
  }
}
