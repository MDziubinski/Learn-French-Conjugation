import 'package:auto_route/annotations.dart';
import 'package:french_conjugation_learn/presentation/home/home_page.dart';

@MaterialAutoRouter(routes: [
  AutoRoute(
    page: MainPage,
    initial: true,
  )
])
class $MainRouter {}
