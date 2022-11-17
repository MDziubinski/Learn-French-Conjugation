import 'package:french_conjugation_learn/data/common/data_mapper.dart';
import 'package:french_conjugation_learn/data/conjugation/dtos/verb_dto.dart';
import 'package:french_conjugation_learn/domain/conjugation/model/verb.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerbDtoToVerbMapper extends DataMapper<VerbDto, Verb> {
  @override
  Verb map(VerbDto data) {
    return Verb(
      infinitif: data.infinitif,
      description: data.description,
      translationExamplesEng: data.translationExamplesEng,
      translationExamplesF: data.translationExamplesF,
      verbGroup: data.verbGroup,
      mappedConjugations: _mapConjugations(
        indicatifConj: mapIndicatif(data),
        subjonctifConj: mapSubjonctif(data),
        conditionnelConj: mapConditionnel(data),
        imperatifConj: mapImperatif(data),
      ),
      mappedSingularForms: _mapSingularForms(data),
    );
  }

  Map<String, String> _mapSingularForms(VerbDto data) {
    return {
      'Auxiliarie': data.auxiliaire,
      'Participe Présent': data.participePresent,
      'Participe Passé': data.participePasse,
      'Forme Pronominale': data.formePronominale,
      'Forme Non Pronominale': data.formeNonPronominale,
    };
  }

  Map<String, Map<String, List<String>>> _mapConjugations({
    required Map<String, List<String>> indicatifConj,
    required Map<String, List<String>> subjonctifConj,
    required Map<String, List<String>> conditionnelConj,
    required Map<String, List<String>> imperatifConj,
  }) {
    return {
      'Indicatif': indicatifConj,
      'Subjonctif': subjonctifConj,
      'Conditionnel': conditionnelConj,
      'Imperatif': imperatifConj,
    };
  }

  Map<String, List<String>> mapIndicatif(VerbDto verb) {
    return {
      'Présent': verb.present,
      'Imparfait': verb.imparfait,
      'Futur Simple': verb.futurSimple,
      'Passe Simple': verb.passeSimple,
      'Passe Compose': verb.passeCompose,
      'Plus Que Parfait': verb.plusQueParfait,
      'Passe Anterieur': verb.passeAnterieur,
      'Futur Anterieur': verb.futurAnterieur,
    };
  }

  Map<String, List<String>> mapSubjonctif(VerbDto verb) {
    return {
      'Présent': verb.subjonctifPresent,
      'Imparfait': verb.subjonctifImparfait,
      'Passé': verb.subjonctifPasse,
      'Plus Que Parfait': verb.subjonctifPlusQueParfait,
    };
  }

  Map<String, List<String>> mapConditionnel(VerbDto verb) {
    return {
      'Présent': verb.conditionnelPresent,
      'Passé première forme': verb.conditionnelPasse,
      'Passé deuxième forme': verb.conditionnelPasseII,
    };
  }

  Map<String, List<String>> mapImperatif(VerbDto verb) {
    return {
      'Présent': verb.imperatif,
      'Passé': verb.imperatifPasse,
    };
  }
}
