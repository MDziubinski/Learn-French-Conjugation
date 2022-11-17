import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:french_conjugation_learn/generated/local_keys.g.dart';
import 'package:french_conjugation_learn/presentation/conjugation/cubit/conjugation_search/conjugation_cubit.dart';

import 'package:french_conjugation_learn/presentation/routing/main_router.gr.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class ConjugationSearchPage extends HookWidget {
  const ConjugationSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<ConjugationCubit>();
    final state = useBlocBuilder(cubit);
    final controller = useTextEditingController();
    final theme = Theme.of(context).extension<CustomAppTheme>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.searchPage_searchVerb.tr(),
          style: theme?.style2.copyWith(color: theme.main),
        ),
        backgroundColor: theme?.tabBar,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.m),
        child: Column(
          children: [
            TextField(
              controller: controller,
              onChanged: (searchParam) {
                cubit.getConjugations(searchParam);
              },
              decoration: InputDecoration(
                  hintText: LocaleKeys.searchPage_writeVerb.tr(),
                  hintStyle: theme?.style0.copyWith(color: theme.secondary)),
              style: theme?.style2,
            ),
            const SizedBox(
              height: AppDimens.l,
            ),
            state.maybeWhen(
              loading: () => const CircularProgressIndicator(),
              empty: () => Expanded(
                child: Center(
                  child: Text(
                    LocaleKeys.searchPage_notFound.tr(),
                    style: theme?.style1,
                  ),
                ),
              ),
              loaded: (conjugations) {
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (_, __) =>
                        const Divider(thickness: AppDimens.xxs),
                    itemCount: conjugations.length,
                    itemBuilder: (context, index) => GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => context.router.push(
                          ConjugationResultPageRoute(
                              verb: conjugations[index])),
                      child: Padding(
                        padding: const EdgeInsets.all(AppDimens.s),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              conjugations[index].infinitif,
                              style: theme?.style4,
                            ),
                            const Icon(Icons.arrow_forward)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              orElse: () => const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
