import 'package:flutter/material.dart';
import 'package:french_conjugation_learn/domain/conjugation/model/verb.dart';
import 'package:french_conjugation_learn/presentation/conjugation/page/conjugation_result_page.dart';
import 'package:french_conjugation_learn/presentation/conjugation/page/conjugation_search_page.dart';
import 'package:french_conjugation_learn/presentation/home/home_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MainPage();
      },
    ),
    GoRoute(
      path: '/conjSearchPage',
      builder: (BuildContext context, GoRouterState state) {
        return const ConjugationSearchPage();
      },
    ),
    GoRoute(
      path: '/conjResultPage',
      builder: (BuildContext context, GoRouterState state) {
        return ConjugationResultPage(verb: state.extra as Verb);
      },
    ),
  ],
);
