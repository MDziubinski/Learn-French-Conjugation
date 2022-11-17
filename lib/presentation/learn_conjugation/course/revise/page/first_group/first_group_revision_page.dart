import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:french_conjugation_learn/generated/local_keys.g.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/revise/cubit/first_group/first_group_revision_cubit.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';
import 'package:french_conjugation_learn/presentation/widget/common/cojugation_content.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class FirstGroupRevisionPage extends HookWidget {
  const FirstGroupRevisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>()!;
    final cubit = useBloc<FirstGroupRevisionCubit>();
    final state = useBlocBuilder(cubit);

    useEffect(() {
      cubit.init();
    }, [cubit]);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.firstGroup_revision.tr(),
          style: theme.style2.copyWith(color: theme.main),
        ),
        backgroundColor: theme.tabBar,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppDimens.m),
            child: Center(
              child: state.maybeWhen(
                idle: (currentVerbConjugation, index, verbCount) => Text(
                  '${index + 1}/$verbCount',
                  style: theme.style2,
                ),
                orElse: () => const SizedBox(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Visibility(
            visible: true,
            child: Positioned(
              left: AppDimens.xl,
              bottom: AppDimens.l,
              child: SizedBox(
                width: AppDimens.xxxxc,
                child: FloatingActionButton.extended(
                  backgroundColor: theme.primary100,
                  heroTag: 'back',
                  onPressed: () {
                    context.router.pop();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text(
                    LocaleKeys.common_leave.tr(),
                    style: theme.style11,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: state.maybeWhen(
              idle: (_, index, verbCount) {
                if (index == verbCount - 1) {
                  return false;
                } else {
                  return true;
                }
              },
              orElse: () => false,
            ),
            child: Positioned(
              right: AppDimens.s,
              bottom: AppDimens.l,
              child: SizedBox(
                width: AppDimens.xxxxc,
                child: FloatingActionButton.extended(
                  backgroundColor: theme.primary100,
                  heroTag: 'next',
                  onPressed: cubit.nextVerb,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text(
                    LocaleKeys.common_continue.tr(),
                    style: theme.style11,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: state.maybeWhen(
        idle: (currentVerbConjugation, _, __) =>
            ConjugationContent(verb: currentVerbConjugation),
        loading: () => const Center(child: CircularProgressIndicator()),
        orElse: () => const SizedBox(),
      ),
    );
  }
}
