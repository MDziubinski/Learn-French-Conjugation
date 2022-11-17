import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:french_conjugation_learn/generated/local_keys.g.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/revise/cubit/revision_verb_group_selection_cubit.dart';
import 'package:french_conjugation_learn/presentation/routing/main_router.gr.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';
import 'package:french_conjugation_learn/presentation/widget/common/option_tile.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class VerbGroupSelectionPage extends HookWidget {
  const VerbGroupSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>();

    final cubit = useBloc<RevisionVerbGroupSelectionCubit>();
    final state = useBlocBuilder(cubit);

    useEffect(() {
      cubit.init();
    }, [cubit]);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.revisionPage_revise.tr(),
          style: theme?.style2.copyWith(color: theme.main),
        ),
        backgroundColor: theme?.tabBar,
      ),
      body: state.maybeWhen(
        idle: (progres) => SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(
              top: AppDimens.m,
              left: AppDimens.m,
              right: AppDimens.m,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  OptionTile(
                    content: LocaleKeys.revisionPage_firstGroupVerbs.tr(),
                    onTapped: () {
                      if (progres.values.every((element) => element == true)) {
                        context.router
                            .push(const FirstGroupRevisionPageRoute());
                      } else {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text(
                              LocaleKeys.common_unavailable.tr(),
                              style: context.style3,
                            ),
                            content: Text(
                              LocaleKeys.revisionPage_unavailable.tr(),
                              style: context.style12,
                            ),
                            actions: [
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  context.router.pop();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(AppDimens.m),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        LocaleKeys.common_continue.tr(),
                                        style: context.style11,
                                      ),
                                      const SizedBox(width: AppDimens.m),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    available: true,
                    height: AppDimens.xxc,
                  ),
                  OptionTile(
                    content: LocaleKeys.revisionPage_secondGroupVerbs.tr(),
                    onTapped: () {},
                    available: false,
                    height: AppDimens.xxc,
                  ),
                  OptionTile(
                    content: LocaleKeys.revisionPage_thirdGroupVerbs.tr(),
                    onTapped: () {},
                    available: false,
                    height: AppDimens.xxc,
                  ),
                ],
              ),
            ),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        orElse: () => const SizedBox(),
      ),
    );
  }
}
