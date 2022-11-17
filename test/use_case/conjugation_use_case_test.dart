import 'package:flutter_test/flutter_test.dart';
import 'package:french_conjugation_learn/domain/conjugation/model/verb.dart';
import 'package:french_conjugation_learn/domain/conjugation/repository/conjugation_respository.dart';
import 'package:french_conjugation_learn/presentation/use_case/get_conjugation_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockedConjugationRepository extends Mock
    implements ConjugationRepository {}

void main() {
  late ConjugationRepository conjugationRepository;
  late GetConjugationUseCase useCase;

  setUp(() {
    conjugationRepository = MockedConjugationRepository();
    useCase = GetConjugationUseCase(conjugationRepository);
  });
  test('Should return list of verbs, depending on passed query', () async {
    final List<Verb> verbs = [];

    when(() => conjugationRepository.getVerbList(''))
        .thenAnswer((_) => Future.value([]));

    final result = await useCase.call('');

    expect(result.length, equals(verbs.length));

    verify(() => conjugationRepository.getVerbList('')).called(1);
  });
}
