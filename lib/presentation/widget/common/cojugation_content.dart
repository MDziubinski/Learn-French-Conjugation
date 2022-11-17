import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:french_conjugation_learn/domain/conjugation/model/verb.dart';
import 'package:french_conjugation_learn/generated/local_keys.g.dart';
import 'package:french_conjugation_learn/presentation/conjugation/widgets/conjugation_tile_widget.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';
import 'package:french_conjugation_learn/presentation/widget/common/singular_form_widget.dart';

class ConjugationContent extends StatelessWidget {
  final Verb verb;

  const ConjugationContent({
    required this.verb,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mappedConj = verb.mappedConjugations;
    final singularForms = verb.mappedSingularForms;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.m),
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
                    style: context.style4,
                  ),
                  Text(
                    verb.infinitif,
                    style: context.style6,
                  ),
                ],
              ),
            ),
            ..._generateSingularFormWidgets(singularForms).toList(),
            const SizedBox(height: AppDimens.xl),
            ..._generateConjugationTilesWidgets(mappedConj).toList(),
            const SizedBox(height: AppDimens.c)
          ],
        ),
      ),
    );
  }

  Iterable<SingularFormWidget> _generateSingularFormWidgets(
      Map<String, String> mappedSingulars) sync* {
    for (final singular in mappedSingulars.entries) {
      yield SingularFormWidget(singularForm: singular);
    }
  }

  Iterable<ConjugationTile> _generateConjugationTilesWidgets(
      Map<String, Map<String, List<String>>> mappedConjugations) sync* {
    for (final mappedConj in mappedConjugations.entries) {
      yield ConjugationTile(
        mappedConj: mappedConj,
      );
    }
  }
}
