import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:french_conjugation_learn/generated/local_keys.g.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';

String currentUserName = '';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    required this.available,
    required this.singIn,
    required this.singOut,
    required this.currentUser,
    super.key,
  });

  final bool available;
  final User? currentUser;
  final VoidCallback singIn;
  final VoidCallback singOut;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>();

    if (currentUser?.displayName != null) {
      currentUserName = currentUser!.displayName!;
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          if (available) ...[
            DrawerHeader(
              decoration: BoxDecoration(color: context.tabBar),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  LocaleKeys.mainPage_sideDrawer_welcome
                      .tr(args: [currentUserName]),
                  style: theme?.style2.copyWith(color: theme.main),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: Text(
                LocaleKeys.mainPage_sideDrawer_logout.tr(),
                style: theme?.style9,
              ),
              onTap: singOut,
            ),
          ] else ...[
            DrawerHeader(
              decoration: BoxDecoration(
                color: context.tabBar,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  LocaleKeys.mainPage_pleaseSignIn.tr(),
                  style: theme?.style2.copyWith(color: theme.main),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.input),
              title: Text(
                LocaleKeys.mainPage_singIn.tr(),
                style: theme?.style9,
              ),
              onTap: singIn,
            ),
          ]
        ],
      ),
    );
  }
}
