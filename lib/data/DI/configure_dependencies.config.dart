// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../domain/conjugation/repository/conjugation_respository.dart'
    as _i20;
import '../../domain/course/repository/course_repository.dart' as _i6;
import '../../domain/course/repository/first_group_repository.dart' as _i41;
import '../../domain/daily_task/repository/daily_task_repository.dart' as _i38;
import '../../domain/user/repository/user_repository.dart' as _i17;
import '../../presentation/conjugation/cubit/conjugation_result/conjugation_result_cubit.dart'
    as _i4;
import '../../presentation/conjugation/cubit/conjugation_search/conjugation_cubit.dart'
    as _i35;
import '../../presentation/daily_tasks/cubit/daily_task_cubit.dart' as _i36;
import '../../presentation/daily_tasks/cubit/daily_task_test_cubit.dart'
    as _i47;
import '../../presentation/home/cubit/main_page_cubit.dart' as _i30;
import '../../presentation/learn_conjugation/course/first_group/cubit/first_group_follow_verb_page_cubit.dart'
    as _i40;
import '../../presentation/learn_conjugation/course/first_group/cubit/first_group_introduction_cubit.dart'
    as _i48;
import '../../presentation/learn_conjugation/course/first_group/cubit/first_group_test_page_cubit.dart'
    as _i49;
import '../../presentation/learn_conjugation/course/introduction/cubit/course_introduction_cubit.dart'
    as _i22;
import '../../presentation/learn_conjugation/course/revise/cubit/first_group/first_group_revision_cubit.dart'
    as _i43;
import '../../presentation/learn_conjugation/course/revise/cubit/revision_verb_group_selection_cubit.dart'
    as _i31;
import '../../presentation/use_case/course/first_group/get_first_group_course_content_use_case.dart'
    as _i45;
import '../../presentation/use_case/course/first_group/get_first_group_test_tasks_use_case.dart'
    as _i46;
import '../../presentation/use_case/course/get_course_introduction_use_case.dart'
    as _i13;
import '../../presentation/use_case/daily_task/get_daily_task_use_case.dart'
    as _i44;
import '../../presentation/use_case/daily_task/update_daily_task_use_case.dart'
    as _i33;
import '../../presentation/use_case/get_conjugation_use_case.dart' as _i24;
import '../../presentation/use_case/get_sign_in_use_case.dart' as _i27;
import '../../presentation/use_case/get_sign_out_use_case.dart' as _i28;
import '../../presentation/use_case/revision/get_first_group_verbs_use_case.dart'
    as _i26;
import '../../presentation/use_case/user/get_current_user_details.dart' as _i29;
import '../../presentation/use_case/user/get_custom_user_data_use_case.dart'
    as _i25;
import '../../presentation/use_case/user/update_user_progres_use_case.dart'
    as _i34;
import '../../presentation/widget/tasks/multi_choice_task/cubit/multi_choice_task_cubit.dart'
    as _i14;
import '../../presentation/widget/tasks/single_choice_task/cubit/single_choice_task_cubit.dart'
    as _i15;
import '../conjugation/mappers/verb_dto_to_verb_mapper.dart' as _i19;
import '../conjugation/repository/conjugation_repository_impl.dart' as _i21;
import '../course/mapper/course_introduction_dto_mapper.dart' as _i5;
import '../course/mapper/first_group/first_group_course_dto_mapper.dart'
    as _i23;
import '../course/mapper/first_group/first_group_follow_verb_dto_mapper.dart'
    as _i9;
import '../course/mapper/first_group/first_group_inflectional_endings_dto_mapper.dart'
    as _i10;
import '../course/mapper/first_group/first_group_introduction_dto_mapper.dart'
    as _i11;
import '../course/mapper/first_group/first_group_main_rules_dto_mapper.dart'
    as _i12;
import '../course/mapper/first_group/first_group_test_answer_dto_mapper.dart'
    as _i16;
import '../course/mapper/first_group/first_group_test_task_dto_mapper.dart'
    as _i32;
import '../course/repository_implementation/course_repository_implementation.dart'
    as _i7;
import '../course/repository_implementation/first_group/first_group_repository_implementation.dart'
    as _i42;
import '../daily_task/mapper/daily_task_dto_mapper.dart' as _i37;
import '../daily_task/repository_implementation/daily_task_repository_implementation.dart'
    as _i39;
import '../google_services/authentication/auth_service.dart' as _i3;
import '../user/mapper/user_dto_mapper.dart' as _i8;
import '../user/repository/user_repository_impl.dart'
    as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AuthService>(() => _i3.AuthService());
  gh.factory<_i4.ConjugationResultCubit>(() => _i4.ConjugationResultCubit());
  gh.factory<_i5.CourseIntroductionDtoToCourseIntroductionMapper>(
      () => _i5.CourseIntroductionDtoToCourseIntroductionMapper());
  gh.lazySingleton<_i6.CourseRepository>(() => _i7.CourseRepositoryImpl(
      get<_i5.CourseIntroductionDtoToCourseIntroductionMapper>()));
  gh.factory<_i8.CustomUserDtoMapper>(() => _i8.CustomUserDtoMapper());
  gh.factory<_i9.FirstGroupFollowVerbDtoMapper>(
      () => _i9.FirstGroupFollowVerbDtoMapper());
  gh.factory<_i10.FirstGroupInflectionalEndingsDtoMapper>(
      () => _i10.FirstGroupInflectionalEndingsDtoMapper());
  gh.factory<_i11.FirstGroupIntroductionDtoMapper>(
      () => _i11.FirstGroupIntroductionDtoMapper());
  gh.factory<_i12.FirstGroupMainRulesDtoMapper>(
      () => _i12.FirstGroupMainRulesDtoMapper());
  gh.factory<_i13.GetCourseIntroductionUseCase>(
      () => _i13.GetCourseIntroductionUseCase(get<_i6.CourseRepository>()));
  gh.factory<_i14.MultiChoiceTaskCubit>(() => _i14.MultiChoiceTaskCubit());
  gh.factory<_i15.SingleChoiceTaskCubit>(() => _i15.SingleChoiceTaskCubit());
  gh.factory<_i16.TestTaskAnswerDtoMapper>(
      () => _i16.TestTaskAnswerDtoMapper());
  gh.lazySingleton<_i17.UserRepository>(() => _i18.UserRepositoryImpl(
        get<_i3.AuthService>(),
        get<_i8.CustomUserDtoMapper>(),
      ));
  gh.factory<_i19.VerbDtoToVerbMapper>(() => _i19.VerbDtoToVerbMapper());
  gh.lazySingleton<_i20.ConjugationRepository>(
      () => _i21.ConjugationRepositoryImpl(get<_i19.VerbDtoToVerbMapper>()));
  gh.factory<_i22.CourseIntroductionCubit>(() =>
      _i22.CourseIntroductionCubit(get<_i13.GetCourseIntroductionUseCase>()));
  gh.factory<_i23.FirstGroupCourseDtoMapper>(() =>
      _i23.FirstGroupCourseDtoMapper(
        firstGroupIntroductionDtoMapper:
            get<_i11.FirstGroupIntroductionDtoMapper>(),
        firstGroupMainRulesDtoMapper: get<_i12.FirstGroupMainRulesDtoMapper>(),
        firstGroupInflectionalEndingsDtoMapper:
            get<_i10.FirstGroupInflectionalEndingsDtoMapper>(),
        firstGroupFollowVerbDtoMapper: get<_i9.FirstGroupFollowVerbDtoMapper>(),
      ));
  gh.factory<_i24.GetConjugationUseCase>(
      () => _i24.GetConjugationUseCase(get<_i20.ConjugationRepository>()));
  gh.factory<_i25.GetCustomUserDataUseCase>(
      () => _i25.GetCustomUserDataUseCase(get<_i17.UserRepository>()));
  gh.factory<_i26.GetFirstGroupVerbsUseCase>(
      () => _i26.GetFirstGroupVerbsUseCase(get<_i20.ConjugationRepository>()));
  gh.factory<_i27.GetSignInUseCase>(
      () => _i27.GetSignInUseCase(get<_i17.UserRepository>()));
  gh.factory<_i28.GetSignOutUseCase>(
      () => _i28.GetSignOutUseCase(get<_i17.UserRepository>()));
  gh.factory<_i29.GetUserDetailsUseCase>(
      () => _i29.GetUserDetailsUseCase(get<_i17.UserRepository>()));
  gh.factory<_i30.MainPageCubit>(() => _i30.MainPageCubit(
        get<_i27.GetSignInUseCase>(),
        get<_i28.GetSignOutUseCase>(),
        get<_i29.GetUserDetailsUseCase>(),
      ));
  gh.factory<_i31.RevisionVerbGroupSelectionCubit>(() =>
      _i31.RevisionVerbGroupSelectionCubit(
          get<_i25.GetCustomUserDataUseCase>()));
  gh.factory<_i32.TaskDtoMapper>(
      () => _i32.TaskDtoMapper(get<_i16.TestTaskAnswerDtoMapper>()));
  gh.factory<_i33.UpdateDailyTasksUseCase>(
      () => _i33.UpdateDailyTasksUseCase(get<_i17.UserRepository>()));
  gh.factory<_i34.UpdateUserProgresUseCase>(
      () => _i34.UpdateUserProgresUseCase(get<_i17.UserRepository>()));
  gh.factory<_i35.ConjugationCubit>(
      () => _i35.ConjugationCubit(get<_i24.GetConjugationUseCase>()));
  gh.factory<_i36.DailyTaskCubit>(
      () => _i36.DailyTaskCubit(get<_i25.GetCustomUserDataUseCase>()));
  gh.factory<_i37.DailyTaskDtoDailyTaskMapper>(() =>
      _i37.DailyTaskDtoDailyTaskMapper(
          taskDtoMapper: get<_i32.TaskDtoMapper>()));
  gh.lazySingleton<_i38.DailyTaskRepository>(() =>
      _i39.DailyTaskRepositoryImpl(get<_i37.DailyTaskDtoDailyTaskMapper>()));
  gh.factory<_i40.FirstGroupFollowVerbPageCubit>(() =>
      _i40.FirstGroupFollowVerbPageCubit(get<_i24.GetConjugationUseCase>()));
  gh.lazySingleton<_i41.FirstGroupRepository>(
      () => _i42.FirstGroupRepositoryImpl(
            get<_i23.FirstGroupCourseDtoMapper>(),
            get<_i32.TaskDtoMapper>(),
          ));
  gh.factory<_i43.FirstGroupRevisionCubit>(() =>
      _i43.FirstGroupRevisionCubit(get<_i26.GetFirstGroupVerbsUseCase>()));
  gh.factory<_i44.GetDailyTasksUseCase>(
      () => _i44.GetDailyTasksUseCase(get<_i38.DailyTaskRepository>()));
  gh.factory<_i45.GetFirstGroupCourseContentUseCase>(() =>
      _i45.GetFirstGroupCourseContentUseCase(get<_i41.FirstGroupRepository>()));
  gh.factory<_i46.GetFirstGroupTaskTestUseCase>(() =>
      _i46.GetFirstGroupTaskTestUseCase(get<_i41.FirstGroupRepository>()));
  gh.factory<_i47.DailyTaskTestCubit>(() => _i47.DailyTaskTestCubit(
        get<_i44.GetDailyTasksUseCase>(),
        get<_i33.UpdateDailyTasksUseCase>(),
      ));
  gh.factory<_i48.FirstGroupCourseContentCubit>(
      () => _i48.FirstGroupCourseContentCubit(
            get<_i45.GetFirstGroupCourseContentUseCase>(),
            get<_i25.GetCustomUserDataUseCase>(),
            get<_i34.UpdateUserProgresUseCase>(),
          ));
  gh.factory<_i49.FirstGroupTestPageCubit>(() => _i49.FirstGroupTestPageCubit(
      getFirstGroupTaskTestUseCase: get<_i46.GetFirstGroupTaskTestUseCase>()));
  return get;
}
