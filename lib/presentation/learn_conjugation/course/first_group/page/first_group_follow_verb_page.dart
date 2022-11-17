import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:french_conjugation_learn/domain/course/model/first_group_models/first_group_course_content.dart';
import 'package:french_conjugation_learn/generated/local_keys.g.dart';
import 'package:french_conjugation_learn/presentation/conjugation/widgets/conjugation_tile_widget.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/first_group/cubit/first_group_follow_verb_page_cubit.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/first_group/cubit/first_group_introduction_cubit.dart';
import 'package:french_conjugation_learn/presentation/routing/main_router.gr.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';
import 'package:french_conjugation_learn/presentation/widget/common/singular_form_widget.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class FirstGroupFollowVerbPage extends HookWidget {
  final FirstGroupCourse firstGroupCourse;
  final FirstGroupCourseContentCubit mainCubit;

  const FirstGroupFollowVerbPage({
    required this.firstGroupCourse,
    required this.mainCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<FirstGroupFollowVerbPageCubit>();
    final state = useBlocBuilder(cubit);

    final theme = Theme.of(context).extension<CustomAppTheme>()!;

    useEffect(() {
      cubit.init();
    }, [cubit]);

    return Scaffold(
      backgroundColor: theme.background,
      appBar: AppBar(
        title: Text(
          LocaleKeys.common_continue.tr(),
          style: theme.style2.copyWith(color: theme.main),
        ),
        backgroundColor: theme.tabBar,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: theme.primary100,
        onPressed: () {
          mainCubit.updateProgres('firstGroupFollowVerb');
          context.router.replace(FirstGroupTestPageRoute(
            mainCubit: mainCubit,
          ));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.m),
        ),
        label: Text(
          LocaleKeys.firstGroup_followVerb_description.tr(),
          style: theme.style11,
        ),
      ),
      body: state.maybeWhen(
        loaded: (followVerb) {
          final mappedConj = followVerb.mappedConjugations;
          final singularForms = followVerb.mappedSingularForms;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.m),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    firstGroupCourse.inflectionalEndings.description.first,
                    style: theme.style9,
                  ),
                  const SizedBox(height: AppDimens.l),
                  ..._generateSingularFormWidgets(singularForms).toList(),
                  const SizedBox(height: AppDimens.xl),
                  ..._generateConjugationTilesWidgets(mappedConj).toList(),
                  const SizedBox(height: AppDimens.xl),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        orElse: () => const SizedBox(),
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
