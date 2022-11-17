import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:french_conjugation_learn/domain/conjugation/model/verb.dart';
import 'package:french_conjugation_learn/generated/local_keys.g.dart';
import 'package:french_conjugation_learn/presentation/conjugation/cubit/conjugation_result/conjugation_result_cubit.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';
import 'package:french_conjugation_learn/presentation/widget/common/cojugation_content.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class ConjugationResultPage extends HookWidget {
  final Verb verb;

  const ConjugationResultPage({
    required this.verb,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>()!;
    final cubit = useBloc<ConjugationResultCubit>();
    final state = useBlocBuilder(cubit);

    useEffect(() {
      cubit.init(verb);
    }, [cubit]);

    return Scaffold(
        backgroundColor: theme.background,
        bottomNavigationBar: BottomNavigationBar(
          onTap: cubit.changeContent,
          currentIndex: state.maybeWhen(
            idle: (_, index) {
              return index;
            },
            description: (
              _,
              __,
              ___,
              index,
            ) {
              return index;
            },
            orElse: () {
              return 0;
            },
          ),
          selectedLabelStyle: theme.style16,
          unselectedLabelStyle: theme.style16,
          selectedItemColor: theme.primary100,
          unselectedItemColor: theme.grey30,
          items: [
            BottomNavigationBarItem(
              activeIcon: const Icon(Icons.abc),
              icon: const Icon(Icons.abc),
              label: LocaleKeys.common_conjugation.tr(),
            ),
            BottomNavigationBarItem(
              activeIcon: const Icon(Icons.description),
              icon: const Icon(Icons.description),
              label: LocaleKeys.conjugationPage_descriptionAndExamples.tr(),
            ),
          ],
        ),
        appBar: AppBar(
          title: Text(
            verb.infinitif,
            style: theme.style2.copyWith(color: theme.main),
          ),
          backgroundColor: theme.tabBar,
        ),
        body: state.maybeWhen(
          idle: (verb, index) => ConjugationContent(verb: verb),
          description: (
            description,
            engExamples,
            frExamples,
            _,
          ) =>
              DescriptionContent(
            description: description,
            engExamples: engExamples,
            frExamples: frExamples,
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          orElse: () => const SizedBox(),
        ));
  }
}

class DescriptionContent extends StatelessWidget {
  final String description;
  final List<String> engExamples;
  final List<String> frExamples;

  const DescriptionContent({
    required this.description,
    required this.engExamples,
    required this.frExamples,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (description.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(AppDimens.m),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                description,
                style: context.style9,
              ),
              const SizedBox(height: AppDimens.xl),
              Text(
                LocaleKeys.conjugationPage_examplesOfUse.tr(),
                style: context.style6,
              ),
              const SizedBox(height: AppDimens.xl),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: engExamples.length,
                separatorBuilder: (_, __) =>
                    const Divider(thickness: AppDimens.xxs),
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      frExamples[index],
                      style: context.style8,
                    ),
                    const SizedBox(height: AppDimens.s),
                    Text(
                      engExamples[index],
                      style: context.style9,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimens.xl),
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(AppDimens.m),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.common_unfortunately.tr(),
              style: context.style2,
            ),
            Text(
              LocaleKeys.conjugationPage_noDescription.tr(),
              style: context.style5,
            ),
          ],
        ),
      );
    }
  }
}
