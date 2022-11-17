import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:french_conjugation_learn/domain/course/model/first_group_models/first_group_course_content.dart';
import 'package:french_conjugation_learn/domain/user/model/custom_user.dart';
import 'package:french_conjugation_learn/main.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/first_group/cubit/first_group_introduction_state.dart';
import 'package:french_conjugation_learn/presentation/use_case/course/first_group/get_first_group_course_content_use_case.dart';
import 'package:french_conjugation_learn/presentation/use_case/user/get_custom_user_data_use_case.dart';
import 'package:french_conjugation_learn/presentation/use_case/user/update_user_progres_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirstGroupCourseContentCubit extends Cubit<FirstGroupCourseContentState> {
  final GetFirstGroupCourseContentUseCase firstGroupIntroductionUseCase;
  final GetCustomUserDataUseCase getCustomUserDataUseCase;
  final UpdateUserProgresUseCase updateUserProgresUseCase;
  late FirstGroupCourse _firstGroupCourse;
  late CustomUser _customUser;

  FirstGroupCourseContentCubit(
    this.firstGroupIntroductionUseCase,
    this.getCustomUserDataUseCase,
    this.updateUserProgresUseCase,
  ) : super(const FirstGroupCourseContentState.initial());

  Future<void> init() async {
    try {
      emit(const FirstGroupCourseContentState.loading());
      _firstGroupCourse = await firstGroupIntroductionUseCase.call();
      _customUser = await getCustomUserDataUseCase.call();
      _emitLoaded();
    } catch (e, st) {
      logger.e('Error! Failed to get first group course content', e, st);
    }
  }

  Future<void> _getProgres() async {
    try {
      emit(const FirstGroupCourseContentState.loading());
      _customUser = await getCustomUserDataUseCase.call();

      _emitLoaded();
    } catch (e, st) {
      logger.e('Error! Failed to get user progres', e, st);
    }
  }

  Future<void> updateProgres(String progresKey) async {
    await updateUserProgresUseCase.call(progresKey);
    await _getProgres();
  }

  void _emitLoaded() {
    emit(FirstGroupCourseContentState.loaded(
      firstGroupCourse: _firstGroupCourse,
      progres: _customUser.progres,
    ));
  }
}
