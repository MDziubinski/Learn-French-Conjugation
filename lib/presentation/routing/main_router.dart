import 'package:auto_route/annotations.dart';

import 'package:french_conjugation_learn/presentation/conjugation/page/conjugation_result_page.dart';
import 'package:french_conjugation_learn/presentation/conjugation/page/conjugation_search_page.dart';
import 'package:french_conjugation_learn/presentation/daily_tasks/page/daily_task_page.dart';
import 'package:french_conjugation_learn/presentation/daily_tasks/page/daily_task_test_page.dart';
import 'package:french_conjugation_learn/presentation/daily_tasks/page/daily_task_test_result_page.dart';
import 'package:french_conjugation_learn/presentation/home/main_page.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/first_group/page/first_group_follow_verb_page.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/first_group/page/first_group_inflectional_endings_page.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/first_group/page/first_group_introduction_page.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/first_group/page/first_group_main_page.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/first_group/page/first_group_main_rules_page.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/first_group/page/first_group_test_page.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/first_group/page/first_group_test_result_page.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/introduction/page/course_introduction_page.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/page/course_selection_page.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/revise/page/first_group/first_group_revision_page.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/revise/page/reivision_verb_group_selection_page.dart';

import 'package:french_conjugation_learn/presentation/learn_conjugation/page/learn_conjugation_main_page.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(
      page: MainPage,
      name: 'MainPageRoute',
      initial: true,
    ),
    AutoRoute(page: ConjugationResultPage),
    AutoRoute(page: ConjugationSearchPage),
    AutoRoute(page: FirstGroupMainPage),
    AutoRoute(page: LearnConjugationMainPage),
    AutoRoute(page: CourseSelectionPage, name: 'CourseSelectionPageRoute'),
    AutoRoute(page: CourseIntroductionPage),
    AutoRoute(page: DailyTaskPage),
    AutoRoute(page: DailyTaskTestPage),
    AutoRoute(page: DailyTaskTestResultPage),
    AutoRoute(page: FirstGroupIntroductionPage),
    AutoRoute(page: FirstGroupMainRulesPage),
    AutoRoute(page: FirstGroupInflectionalEndingsPage),
    AutoRoute(page: FirstGroupFollowVerbPage),
    AutoRoute(page: FirstGroupTestPage),
    AutoRoute(page: FirstGroupTestResultPage),
    AutoRoute(page: VerbGroupSelectionPage),
    AutoRoute(page: FirstGroupRevisionPage),
  ],
)
class $MainRouter {}
