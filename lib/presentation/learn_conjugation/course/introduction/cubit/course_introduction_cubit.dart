import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:french_conjugation_learn/domain/course/model/course_introduction.dart';
import 'package:french_conjugation_learn/main.dart';
import 'package:french_conjugation_learn/presentation/learn_conjugation/course/introduction/cubit/course_introduction_state.dart';
import 'package:french_conjugation_learn/presentation/use_case/course/get_course_introduction_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class CourseIntroductionCubit extends Cubit<CourseIntroductionState> {
  final GetCourseIntroductionUseCase _getCourseIntroductionUseCase;
  late CourseIntroduction _courseIntroduction;

  CourseIntroductionCubit(this._getCourseIntroductionUseCase)
      : super(const CourseIntroductionState.initial());

  Future<void> init() async {
    try {
      emit(const CourseIntroductionState.loading());
      _courseIntroduction = await _getCourseIntroductionUseCase.call();
      _emitLoaded();
    } catch (e, st) {
      logger.e('Error! Failed to get course introduction', e, st);
    }
  }

  void _emitLoaded() {
    emit(CourseIntroductionState.loaded(
        courseIntroduction: _courseIntroduction));
  }
}
