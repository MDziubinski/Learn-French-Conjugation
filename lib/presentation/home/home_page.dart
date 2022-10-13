import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:french_conjugation_learn/generated/local_keys.g.dart';
import 'package:french_conjugation_learn/presentation/conjugation/page/side_drawer.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>();
    print(DateTime.now());
    return Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(
        title: Text(
          'Conjugeo',
          style: theme?.style2.copyWith(color: theme.main),
        ),
        backgroundColor: theme?.tabBar,
      ),
      body: SizedBox(
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
                MainPageTile(
                  content: LocaleKeys.mainPage_dailyTask.tr(),
                  onTapped: () {},
                ),
                MainPageTile(
                    content: LocaleKeys.mainPage_checkConjguation.tr(),
                    onTapped: () => context.push('/conjSearchPage')),
                MainPageTile(
                  content: LocaleKeys.mainPage_learnConjugation.tr(),
                  onTapped: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainPageTile extends StatelessWidget {
  const MainPageTile({
    required this.content,
    required this.onTapped,
    Key? key,
  }) : super(key: key);

  final String content;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>();

    return GestureDetector(
      onTap: onTapped,
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppDimens.s),
        child: Container(
          height: AppDimens.mainPageTileHeight,
          decoration: BoxDecoration(
            //color: theme?.primary100,
            color: context.primary100,
            borderRadius: BorderRadius.circular(16),
          ),
          width: double.infinity,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: AppDimens.s,
                left: AppDimens.s,
              ),
              child: Text(
                content,
                style: theme?.style11,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
