import 'package:auto_route/annotations.dart';
import 'package:french_conjugation_learn/presentation/conjugation/page/conjugation_result_page.dart';
import 'package:french_conjugation_learn/presentation/conjugation/page/conjugation_search_page.dart';

import 'package:french_conjugation_learn/presentation/home/home_page.dart';

@MaterialAutoRouter(routes: [
  AutoRoute(
    page: MainPage,
    initial: true,
  ),
  AutoRoute(
    page: ConjugationResultPage,
  ),
  AutoRoute(
    page: ConjugationSearchPage,
  )
])
class $MainRouter {}
