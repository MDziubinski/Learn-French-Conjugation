import 'package:flutter/material.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.tabBar,
            ),
            child: Text(
              'Side menu',
              style: theme?.style2.copyWith(color: theme.main),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.input),
            title: Text(
              'Welcome',
              style: theme?.style9,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: Text(
              'Profile',
              style: theme?.style9,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              'Settings',
              style: theme?.style9,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: Text(
              'Feedback',
              style: theme?.style9,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: Text(
              'Logout',
              style: theme?.style9,
            ),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
