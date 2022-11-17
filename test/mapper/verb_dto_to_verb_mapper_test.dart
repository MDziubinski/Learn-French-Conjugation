import 'package:flutter_test/flutter_test.dart';
import 'package:french_conjugation_learn/data/conjugation/dtos/verb_dto.dart';
import 'package:french_conjugation_learn/data/conjugation/mappers/verb_dto_to_verb_mapper.dart';

void main() {
  final verbDto = VerbDto(
    infinitif: 'infinitif',
    participePresent: 'participePresent',
    participePasse: 'participePasse',
    auxiliaire: 'auxiliaire',
    formePronominale: 'formePronominale',
    formeNonPronominale: 'formeNonPronominale',
    present: [],
    imparfait: [],
    passeSimple: [],
    futurSimple: [],
    passeCompose: [],
    plusQueParfait: [],
    passeAnterieur: [],
    futurAnterieur: [],
    subjonctifPresent: [],
    subjonctifImparfait: [],
    subjonctifPasse: [],
    subjonctifPlusQueParfait: [],
    conditionnelPresent: [],
    conditionnelPasse: [],
    conditionnelPasseII: [],
    imperatif: [],
    imperatifPasse: [],
    description: '',
    translationExamplesEng: [],
    translationExamplesF: [],
    verbGroup: 1,
  );

  final mapper = VerbDtoToVerbMapper();

  test('Test VerbDtoToVerbMapper', () {
    final mappedVerb = mapper.map(verbDto);

    expect(mappedVerb.description, verbDto.description);
    expect(mappedVerb.verbGroup, verbDto.verbGroup);
    expect(mappedVerb.infinitif, verbDto.infinitif);
  });
}
