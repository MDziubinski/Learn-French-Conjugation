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
      participePresent: data.participePresent,
      participePasse: data.participePasse,
      auxiliaire: data.auxiliaire,
      formePronominale: data.formePronominale,
      formeNonPronominale: data.formeNonPronominale,
      indicatifConj: mapIndicatif(data),
      conditionnelConj: mapConditionnel(data),
      subjonctifConj: mapSubjonctif(data),
      imperatifConj: mapImperatif(data),
    );
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
