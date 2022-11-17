import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:french_conjugation_learn/generated/local_keys.g.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/introduction/cubit/course_introduction_cubit.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';
import 'package:french_conjugation_learn/presentation/widget/common/custom_page_indicator.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class CourseIntroductionPage extends HookWidget {
  const CourseIntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>()!;
    final pageController = usePageController();
    final cubit = useBloc<CourseIntroductionCubit>();
    final state = useBlocBuilder(cubit);

    useEffect(() {
      cubit.init();
    }, [cubit]);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.coursePage_introduction.tr(),
          style: theme.style2.copyWith(color: theme.main),
        ),
        backgroundColor: theme.tabBar,
      ),
      body: state.maybeWhen(
        loaded: (courseIntroduction) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: courseIntroduction.courseDescriptions.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(AppDimens.m),
                        child: Text(
                          courseIntroduction.courseDescriptions[index],
                          textAlign: TextAlign.center,
                          style: context.style5,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.l),
                child: SizedBox(
                  height: AppDimens.l,
                  width: AppDimens.c,
                  child: CustomPageIndicator(
                    controller: pageController,
                    count: courseIntroduction.courseDescriptions.length,
                    activeColor: theme.primary100,
                    inactiveColor: theme.grey30,
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => Center(
            child: CircularProgressIndicator(
          color: theme.primary100,
        )),
        orElse: () => const SizedBox(),
      ),
    );
  }
}
