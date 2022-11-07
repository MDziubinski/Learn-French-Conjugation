import 'package:flutter/material.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';

const _consonantList = ['a', 'e', 'i', 'o', 'u'];
const _personList = ['je', 'tu', 'il/elle', 'nous', 'vous', 'ils/elles', 'j\''];
const _subjonctif = 'Subjonctif';
const _queRelativePronoun = ['qu\'', 'que'];
const _gridCrossCount = 2;
const _gridChildAspectRatio = 0.80;

class ConjugationTile extends StatelessWidget {
  const ConjugationTile({
    Key? key,
    required this.mappedConj,
  }) : super(key: key);

  final MapEntry<String, Map<String, List<String>>> mappedConj;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>();

    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.l),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: AppDimens.m),
            child: Text(mappedConj.key, style: theme?.style6),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: _gridCrossCount,
            childAspectRatio: _gridChildAspectRatio,
            children: List.generate(
              mappedConj.value.length,
              (indexMain) {
                final personList = setPerson(
                    mappedConj.value.values.elementAt(indexMain),
                    mappedConj.key == _subjonctif);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: AppDimens.sm),
                      child: Text(
                        mappedConj.value.keys.elementAt(indexMain),
                        style: theme?.style11,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            mappedConj.value.values.elementAt(indexMain).length,
                        itemBuilder: (context, indexSecondary) => Row(
                          children: [
                            Text(
                              '${personList[indexSecondary]} ',
                              style: theme?.style15,
                            ),
                            Expanded(
                              child: Text(
                                mappedConj.value.values
                                    .elementAt(indexMain)[indexSecondary],
                                style: theme?.style13,
                              ),
                            ),
                          ],
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

  List<String> setPerson(List<String> verbList, bool isSubjonctif) {
    List<String> result = List.from(_personList);

    if (_consonantList.contains(verbList.first.characters.first)) {
      result.first = _personList.last;
      result.removeLast();
    }
    if (isSubjonctif) {
      result = result.map((person) {
        if (_consonantList.contains(person.characters.first)) {
          return "${_queRelativePronoun.first}$person";
        } else {
          return "${_queRelativePronoun.last} $person";
        }
      }).toList();
    }
    return result;
  }
}
