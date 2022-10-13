// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../domain/conjugation/model/verb.dart' as _i6;
import '../conjugation/page/conjugation_result_page.dart' as _i2;
import '../conjugation/page/conjugation_search_page.dart' as _i3;
import '../home/home_page.dart' as _i1;

class MainRouter extends _i4.RootStackRouter {
  MainRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MainPageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    ConjugationResultPageRoute.name: (routeData) {
      final args = routeData.argsAs<ConjugationResultPageRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.ConjugationResultPage(
          key: args.key,
          verb: args.verb,
        ),
      );
    },
    ConjugationSearchPageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ConjugationSearchPage(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          MainPageRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          ConjugationResultPageRoute.name,
          path: '/conjugation-result-page',
        ),
        _i4.RouteConfig(
          ConjugationSearchPageRoute.name,
          path: '/conjugation-search-page',
        ),
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainPageRoute extends _i4.PageRouteInfo<void> {
  const MainPageRoute()
      : super(
          MainPageRoute.name,
          path: '/',
        );

  static const String name = 'MainPageRoute';
}

/// generated route for
/// [_i2.ConjugationResultPage]
class ConjugationResultPageRoute
    extends _i4.PageRouteInfo<ConjugationResultPageRouteArgs> {
  ConjugationResultPageRoute({
    _i5.Key? key,
    required _i6.Verb verb,
  }) : super(
          ConjugationResultPageRoute.name,
          path: '/conjugation-result-page',
          args: ConjugationResultPageRouteArgs(
            key: key,
            verb: verb,
          ),
        );

  static const String name = 'ConjugationResultPageRoute';
}

class ConjugationResultPageRouteArgs {
  const ConjugationResultPageRouteArgs({
    this.key,
    required this.verb,
  });

  final _i5.Key? key;

  final _i6.Verb verb;

  @override
  String toString() {
    return 'ConjugationResultPageRouteArgs{key: $key, verb: $verb}';
  }
}

/// generated route for
/// [_i3.ConjugationSearchPage]
class ConjugationSearchPageRoute extends _i4.PageRouteInfo<void> {
  const ConjugationSearchPageRoute()
      : super(
          ConjugationSearchPageRoute.name,
          path: '/conjugation-search-page',
        );

  static const String name = 'ConjugationSearchPageRoute';
}
