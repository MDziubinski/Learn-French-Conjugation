import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';

import '../../../generated/local_keys.g.dart';

class AuthDialog extends StatelessWidget {
  const AuthDialog({
    required this.singIn,
    Key? key,
  }) : super(key: key);

  final VoidCallback singIn;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        LocaleKeys.mainPage_singIn.tr(),
        style: context.style3,
      ),
      content: Text(
        LocaleKeys.mainPage_pleaseSingInToSee.tr(),
        style: context.style12,
      ),
      actions: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            singIn();
            context.router.pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.m),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  LocaleKeys.mainPage_googleSignIn.tr(),
                  style: context.style11,
                ),
                const SizedBox(width: AppDimens.m),
                const Icon(Icons.login),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
