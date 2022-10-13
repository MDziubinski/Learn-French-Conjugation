import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:french_conjugation_learn/domain/conjugation/model/verb.dart';
import 'package:french_conjugation_learn/generated/local_keys.g.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';

class ConjugationResultPage extends StatelessWidget {
  final Verb verb;

  const ConjugationResultPage({
    Key? key,
    required this.verb,
  }) : super(key: key);

  Map<String, Map<String, List<String>>> _mapConjugations(Verb verb) {
    return {
      'Indicatif': verb.indicatifConj,
      'Subjonctif': verb.subjonctifConj,
      'Conditionnel': verb.conditionnelConj,
      'Imperatif': verb.imperatifConj,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>();
    final mappedConj = _mapConjugations(verb);

    return Scaffold(
      backgroundColor: theme?.background,
      appBar: AppBar(
        title: Text(
          verb.infinitif,
          style: theme?.style2.copyWith(color: theme.main),
        ),
        backgroundColor: theme?.tabBar,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppDimens.m),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: AppDimens.l),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.conjugationPage_conjugationOf.tr(),
                      style: theme?.style4,
                    ),
                    Text(
                      verb.infinitif,
                      style: theme?.style6,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Auxiliarie',
                    style: theme?.style11,
                  ),
                  Text(
                    verb.auxiliaire,
                    style: theme?.style9,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Participe Présent',
                    style: theme?.style11,
                  ),
                  Text(
                    verb.participePresent,
                    style: theme?.style9,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Participe Passé',
                    style: theme?.style11,
                  ),
                  Text(
                    verb.participePasse,
                    style: theme?.style9,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Forme Pronominale',
                    style: theme?.style11,
                  ),
                  Text(
                    verb.formePronominale,
                    style: theme?.style9,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Forme Non Pronominale',
                    style: theme?.style11,
                  ),
                  Text(
                    verb.formeNonPronominale,
                    style: theme?.style9,
                  ),
                ],
              ),
              SizedBox(height: AppDimens.m),
              ConjugationTile(mappedConj: mappedConj, mapIndex: 0),
              ConjugationTile(mappedConj: mappedConj, mapIndex: 1),
              ConjugationTile(mappedConj: mappedConj, mapIndex: 2),
              ConjugationTile(mappedConj: mappedConj, mapIndex: 3),
            ],
          ),
        ),
      ),
    );
  }
}

class ConjugationTile extends StatelessWidget {
  const ConjugationTile({
    Key? key,
    required this.mappedConj,
    required this.mapIndex,
  }) : super(key: key);

  final Map<String, Map<String, List<String>>> mappedConj;
  final mapIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>();

    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.l),
      child: Column(
        children: [
          Text(mappedConj.keys.toList()[mapIndex], style: theme?.style8),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 0.9,
            children: List.generate(
              mappedConj.entries.elementAt(mapIndex).value.length,
              (indexMain) {
                final currentElement = mappedConj.entries.elementAt(mapIndex);
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(AppDimens.sm),
                      child: Text(
                        currentElement.value.keys.elementAt(indexMain),
                        style: theme?.style11,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: currentElement.value.values
                            .elementAt(indexMain)
                            .length,
                        itemBuilder: (context, indexSecondary) => Text(
                          currentElement.value.values
                              .elementAt(indexMain)[indexSecondary],
                          style: theme?.style9,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
